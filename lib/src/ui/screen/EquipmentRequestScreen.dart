import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/model/EquipmentRequestModel.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/EquipmentRequestScreenViewModel.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';

class EquipmentRequestScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;

  EquipmentRequestScreen(
      this.studentId, this.erpCode, this.name, this.grade, this.parallel);

  @override
  State<StatefulWidget> createState() => _EquipmentRequestScreenState();
}

class _EquipmentRequestScreenState extends State<EquipmentRequestScreen>
    with RootScreenMixin, SingleTickerProviderStateMixin {
  EquipmentRequestScreenViewModel _viewModel =
      EquipmentRequestScreenViewModel();
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _viewModel.loadListModel(widget.studentId);
    _viewModel.loadHistorical(widget.studentId);
    _onChangeTab() {
      if (_tabController.index == 0) {
        _viewModel.streamSink(_viewModel.listModel);
      } else {
        _viewModel.streamSinkHistorical(_viewModel.listHistorical);
      }
    }

    _tabController = TabController(length: 2, vsync: this)
      ..addListener(_onChangeTab);
    BackButtonInterceptor.add(onBackPressed);
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    _viewModel.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      body: _bodyContent(context),
      bottomNavigationBar: _footerContent(),
    );
  }

  _bodyContent(BuildContext context) {
    return TabBarView(
      controller: _tabController,
      children: [_equipmentList(context), _historicalList()],
    );
  }

  _historicalList() {
    return StreamBuilder(
      stream: _viewModel.streamHistorical,
      builder: (BuildContext context,
          AsyncSnapshot<List<StudentHistoricalEquipmentRequestResult>>
              snapshot) {
        if (!snapshot.hasData)
          return _emptyList('No se han realizado pedidos.');
        final data = snapshot.data!;
        if (data.length == 0) return _emptyList('No se han realizado pedidos.');
        return ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              StudentHistoricalEquipmentRequestResult item = data[index];
              return ListTile(
                title: Text(item.name ?? ""),
                subtitle: Text(
                  _generateItemText(item.price.toStringAsFixed(2),
                      item.quantity.toStringAsFixed(0), '0', '0', false),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text((item.quantity * item.price).toStringAsFixed(2) +
                        ' USD'),
                  ],
                ),
              );
            });
      },
    );
  }

  _emptyList(String message) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      child: Text(
        'No se han realizado pedidos.',
        maxLines: 3,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  _equipmentList(BuildContext context) {
    return StreamBuilder(
      stream: _viewModel.stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<EquipmentRequestModel>> snapshot) {
        if (!snapshot.hasData)
          return _emptyList('No se puede realizar pedidos');
        final data = snapshot.data!;
        if (data.length == 0) return _emptyList('No se puede realizar pedidos');
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: data.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return _cardInformationAnnotations(
                  widget.name, widget.erpCode, widget.grade, widget.parallel);
            } else {
              EquipmentRequestModel model = data[index - 1];
              return GestureDetector(
                onTap: () {
                  if (model.isOptional && model.isSelected) {
                    _asyncInputDialog(
                            context, model.quantity.toStringAsFixed(0))
                        .then((value) {
                      if (value == null) return;
                      if (value.isNotEmpty) {
                        if (model.isRegistrationInterval) {
                          if (double.parse(value) >= model.min &&
                              double.parse(value) <= model.max) {
                            model.quantity = double.parse(value);
                            _viewModel.streamSink(_viewModel.listModel);
                          } else {
                            Utils.showConfirmAlert(
                                context,
                                'Cantidad inválida',
                                'La cantidad no puede ser menor que ' +
                                    model.min.toStringAsFixed(0) +
                                    ' o mayor que ' +
                                    model.max.toStringAsFixed(0),
                                '',
                                'Aceptar',
                                () {});
                          }
                        } else {
                          model.quantity = double.parse(value);
                          _viewModel.streamSink(_viewModel.listModel);
                        }
                      }
                    });
                  }
                },
                child: ListTile(
                  enabled: model.isOptional,
                  leading: Checkbox(
                    activeColor: Colors.red,
                    value: model.isSelected,
                    onChanged: (value) {
                      if (model.isOptional) {
                        _viewModel.changeCheckBox(index - 1);
                      }
                    },
                  ),
                  title: Text(model.name),
                  subtitle: Text(
                    _generateItemText(
                        model.price.toStringAsFixed(2),
                        model.quantity.toStringAsFixed(0),
                        model.min.toStringAsFixed(0),
                        model.max.toStringAsFixed(0),
                        model.isRegistrationInterval),
                  ),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text((model.quantity * model.price).toStringAsFixed(2) +
                          ' USD'),
                    ],
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        alignment: Alignment.centerLeft,
        onPressed: () {
          _viewModel.navigation.navigateBack(context);
        },
      ),
      title: Text(
        AppLocalizations.of(context).translate('menu_title_request'),
      ),
      actions: [
        IconButton(
          tooltip: 'Enviar pedido',
          icon: Icon(
            Icons.send,
            color: Colors.white,
          ),
          onPressed: () {
            Utils.showConfirmAlert(context, 'Solicitud',
                '¿Desea enviar la solicitud?', 'Aceptar', 'Cancelar', () {
              Navigator.of(context, rootNavigator: true).pop();
              _viewModel.sendRequest(context, widget.studentId);
            });
          },
        ),
      ],
      bottom: TabBar(
        controller: _tabController,
        tabs: [
          Tab(child: Text('Realizar Pedido')),
          Tab(icon: Text('Materiales Comprados')),
        ],
      ),
    );
  }

  _footerContent() {
    return StreamBuilder(
      stream: _viewModel.stream,
      builder: (BuildContext context,
          AsyncSnapshot<List<EquipmentRequestModel>> snapshot) {
        double total = 0;
        if (!snapshot.hasData) return _footerContainer(0.0.toStringAsFixed(2));
        final data = snapshot.data!;
        if (data.length == 0) return _footerContainer(0.0.toStringAsFixed(2));
        data.forEach((element) {
          if (element.isSelected) {
            double subtotal = element.price * element.quantity;
            total += subtotal;
          }
        });

        return _footerContainer(total.toStringAsFixed(2));
      },
    );
  }

  _footerContainer(String total) {
    return Container(
      height: 60,
      child: Card(
        elevation: 64,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(Icons.info), onPressed: null),
            Text(
              'Total: ' + total + ' USD',
              style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _cardInformationAnnotations(
      String studentName, String erpCode, String grade, String parallel) {
    return Container(
      child: Card(
        color: Colors.red,
        clipBehavior: Clip.antiAlias,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
              title: Text(
                studentName,
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                'Codigo: ' +
                    erpCode +
                    '\nCurso: ' +
                    grade +
                    '\nParalelo: ' +
                    parallel,
                style: TextStyle(fontSize: 15.0, color: Colors.white),
              ),
              isThreeLine: true,
              leading: Icon(
                Icons.info_outline_rounded,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  _generateItemText(
      String price, String quantity, String min, String max, bool isShowRange) {
    String base =
        'Precio: |price| USD\nCantidad: |quantity|\nMin: |min| - Max: |max|';
    if (!isShowRange) {
      base = 'Precio: |price| USD\nCantidad: |quantity|';
    }
    String result;
    if (isShowRange) {
      result = base.replaceAll('|price|', price);
      result = result.replaceAll('|quantity|', quantity);
      result = result.replaceAll('|min|', min);
      result = result.replaceAll('|max|', max);
    } else {
      result = base.replaceAll('|price|', price);
      result = result.replaceAll('|quantity|', quantity);
    }

    return result;
  }

  Future<String?> _asyncInputDialog(
      BuildContext context, String quantity) async {
    Utils.isDialogActive = true;
    String teamName = '';
    return showDialog(
      context: context,
      barrierDismissible: false,
      // dialog is dismissible with a tap on the barrier
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ingrese la cantidad'),
          content: new Row(
            children: [
              new Expanded(
                child: new TextField(
                  controller: TextEditingController()..text = quantity,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration:
                      new InputDecoration(labelText: 'Cantidad actual:'),
                  onChanged: (value) {
                    teamName = value;
                  },
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Utils.isDialogActive = false;
                Navigator.of(context).pop('');
              },
            ),
            TextButton(
              child: Text(
                'Guardar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Utils.isDialogActive = false;
                if (_isNumeric(teamName)) {
                  double numeric = double.parse(teamName);
                  int value = numeric.toInt();
                  if (value <= 0) {
                    Navigator.of(context).pop('');
                  } else {
                    Navigator.of(context).pop(value.toString());
                  }
                } else {
                  Navigator.of(context).pop('');
                }
              },
            ),
          ],
        );
      },
    );
  }

  bool _isNumeric(String result) {
    if (result == null) {
      return false;
    }
    return double.tryParse(result) != null;
  }
}
