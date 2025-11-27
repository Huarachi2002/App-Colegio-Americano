import 'dart:io';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/LicenseScreenViewModel.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:colegio_americano/src/utils/Validator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tuple/tuple.dart';
import 'package:device_info_plus/device_info_plus.dart';

class LicenseScreen extends StatefulWidget {
  final int studentId;
  final String erpCode;
  final String name;
  final String grade;
  final String parallel;
  final LicenseListResponse? license;

  const LicenseScreen(this.studentId, this.erpCode, this.name, this.grade,
      this.parallel, this.license,
      {Key? key})
      : super(key: key);

  @override
  _LicenseScreenState createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> with RootScreenMixin {
  LicenseScreenViewModel _viewModel = LicenseScreenViewModel();
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  DateTime currentDate = DateTime.now();
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();
  TextEditingController _workDaysController = TextEditingController();
  TextEditingController _reasonController = TextEditingController();
  TextEditingController _contactController = TextEditingController();
  TextEditingController _subjectController = TextEditingController();
  TextEditingController _licenseTypeController = TextEditingController();
  TextEditingController _periodController = TextEditingController();
  TextEditingController _fileNameController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();
  TextEditingController _codeController = TextEditingController();
  bool _val8 = false;
  List<String> _periods = SyncConstants.LICENSE_PERIODS;
  List<String> _types = SyncConstants.LICENSE_TYPES;
  List<String> _status = SyncConstants.LICENSE_STATUS;

  String _fileName = "";
  bool _hasFile = false;
  List<PlatformFile>? _paths;
  String? _directoryPath;
  String? _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType = FileType.any;
  TextEditingController _controller = TextEditingController();
  String _quantityLabel = "Cantidad";

  bool _codeGenerated = false;

  bool isEnabled() =>
      (widget.license != null && widget.license!.status != "Rechazado");

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
    if (widget.license != null) {
      final license = widget.license!;
      DateTime startDate = license.startDate!;
      if (license.statusId == 4) {
        _reasonController.text = "[RECHAZADO] " + license.rejectionReason!;
      } else {
        _reasonController.text = license.reason!;
      }

      _val8 = license.test!;
      _contactController.text =
      (license.requesterName == null) ? "" : license.requesterName!;
      _subjectController.text =
      (license.subject == null) ? "" : license.subject!;
      _licenseTypeController.text = license.licenseType.toString();
      _viewModel.setLicenseType(license.licenseType!);
      _viewModel.setPeriod(license.licensePeriod!);
      _viewModel.setStartDate(license.startDate!);
      if (license.licensePeriod == LicenseScreenViewModel.PERIOD_HOUR) {
        _viewModel.setEndDate(
            license.startDate!.add(Duration(hours: license.quantityPeriod!)));
      } else {
        _viewModel.setEndDate(
            license.startDate!.add(Duration(days: license.quantityPeriod!)));
      }
      _viewModel.setReason(license.reason!);
      _viewModel.setLicenseFiles(license.attachments?.toList() ?? []);
    }
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: _appBar(context),
      body: _bodyContent(context),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          onPressed: () async {
            _viewModel.navigation.navigateBack(context);
          },
        ),
        title: Text(
          AppLocalizations.of(context).translate('menu_title_license_requests'),
        ),
        actions: [
          if (widget.license == null ||
              (widget.license != null && widget.license!.statusId == 4))
            IconButton(onPressed: _handleFormSubmit, icon: Icon(Icons.send))
        ]);
  }

  _bodyContent(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.license == null) {
        _viewModel.setShowSecurityCodeSection(true);
        return;
      }
      final license = widget.license!;
      DateTime startDate = license.startDate!;
      _startDateController.text = _formatDate(license.startDate!);
      if (license.licensePeriod == LicenseScreenViewModel.PERIOD_DAY) {
        _endDateController.text =
            _formatDate(_viewModel.getEndDate(license.quantityPeriod!));
        _workDaysController.text = license.quantityPeriod!.toString();
        _quantityController.text = license.quantityPeriod!.toString();
      } else {
        _endDateController.text = _formatDate(
            startDate.add(Duration(hours: license.quantityPeriod!)));
        _workDaysController.text = "1";
        _quantityController.text = "1";
      }
      _viewModel.setShowSecurityCodeSection(license.statusId > 4);
    });
    return SingleChildScrollView(
      child: Column(children: [
        _cardInformationAnnotations(
          widget.name,
          widget.erpCode,
          widget.grade,
          widget.parallel,
        ),
        _cardFormLicense()
      ]),
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

  _cardFormLicense() {
    return Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _licenseTypesField(),
                  SizedBox(height: 8),
                  _examField(),
                  SizedBox(height: 8),
                  _subjectField(),
                  SizedBox(height: 8),
                  _periodField(),
                  SizedBox(height: 8),
                  _quantityField(),
                  SizedBox(height: 8),
                  _startDateField(),
                  SizedBox(height: 8),
                  _endDateField(),
                  SizedBox(height: 8),
                  _reasonsField(),
                  SizedBox(height: 8),
                  _contactsField(),
                  SizedBox(height: 8),
                  _fileField(),
                  SizedBox(height: 8),
                  _securityCode(),
                  SizedBox(height: 8),
                  _generateCode(),
                  SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _subjectField() {
    return StreamBuilder(
      stream: _viewModel.subjectStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextFormField(
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).translate("subject_field"),
          ),
          textInputAction: TextInputAction.next,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onChanged: (i) => _handleSubjectChange(i),
          controller: _subjectController,
        );
      },
    );
  }

  Widget _licenseTypesField() {
    return StreamBuilder(
      stream: _viewModel.licenseTypeStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return DropdownButtonFormField<int>(
          hint: Text(
              AppLocalizations.of(context).translate("license_types_label")),
          focusNode: null,
          value: (widget.license != null) ? widget.license!.licenseType : null,
          onChanged: (i) => _handleLicenseTypeChange(i!),
          items: _types.map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: _types.indexOf(location) + 1,
            );
          }).toList(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (int? value) => validate(
            context,
            [() => isNotEmpty(value), () => isNumeric(value)],
          ),
        );
      },
    );
  }

  Widget _periodField() {
    return StreamBuilder(
      stream: _viewModel.periodStream,
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        return DropdownButtonFormField<int>(
          hint: Text(AppLocalizations.of(context).translate("periodo_label")),
          focusNode: null,
          value:
          (widget.license != null) ? widget.license!.licensePeriod : null,
          onChanged: (i) => _handlePeriodChange(i!),
          items: _periods.map((location) {
            return DropdownMenuItem(
              child: new Text(location),
              value: _periods.indexOf(location) + 1,
            );
          }).toList(),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (int? value) => validate(
            context,
            [() => isNotEmpty(value), () => isNumeric(value)],
          ),
        );
      },
    );
  }

  Widget _startDateField() {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate("start_date_label"),
        suffixIcon: Icon(
          Icons.date_range,
          color: Colors.red,
        ),
      ),
      controller: _startDateController,
      onTap: () => _handleStartDatePicker(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) =>
          validate(context, [() => isNotEmpty(value)]),
    );
  }

  Widget _endDateField() {
    return TextFormField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate("end_date_label"),
        suffixIcon: Icon(
          Icons.date_range,
          color: Colors.red,
        ),
      ),
      onTap: () => null,
      controller: _endDateController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (String? value) =>
          validate(context, [() => isNotEmpty(value)]),
    );
  }

  Widget _quantityField() {
    return StreamBuilder(
        stream: _viewModel.quantityStream,
        builder:
            (BuildContext context, AsyncSnapshot<Tuple2<int, bool>> snapshot) {
          return IgnorePointer(
            ignoring: snapshot.hasData ? !(snapshot.data!.item2) : isEnabled(),
            child: TextFormField(
              enabled: snapshot.hasData ? (snapshot.data!.item2) : !isEnabled(),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: _quantityLabel,
              ),
              controller: _quantityController,
              onChanged: (i) => _handleQuantityChange(int.parse(i)),
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) => validate(context, [
                    () => isNotEmpty(value),
                    () => isDouble(value),
                    () => isNotZero(value)
              ]),
            ),
          );
        });
  }

  Widget _examField() {
    return CheckboxListTile(
      activeColor: Colors.red,
      contentPadding: const EdgeInsets.all(0),
      title: Text(AppLocalizations.of(context).translate("exam_label")),
      value: _val8,
      onChanged: (bool? value) {
        setState(() {
          _val8 = value!;
        });
      },
    );
  }

  Widget _reasonsField() {
    return StreamBuilder(
      stream: _viewModel.reasonStream,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return TextFormField(
          controller: _reasonController,
          keyboardType: TextInputType.name,
          textCapitalization: TextCapitalization.none,
          maxLines: null,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context).translate("reasons_label"),
          ),
          textInputAction: TextInputAction.done,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (String? value) =>
              validate(context, [() => isNotEmpty(value)]),
          onChanged: (i) => _handleReasonChange(i),
        );
      },
    );
  }

  Widget _contactsField() {
    return TextFormField(
      controller: _contactController,
      keyboardType: TextInputType.name,
      textCapitalization: TextCapitalization.sentences,
      minLines: 2,
      maxLines: 6,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context).translate("contacts_label"),
      ),
      textInputAction: TextInputAction.done,
      autovalidateMode: AutovalidateMode.onUserInteraction,
    );
  }

  Widget _fileField() {
    return StreamBuilder(
        stream: _viewModel.filesStream,
        builder:
            (BuildContext context, AsyncSnapshot<List<LicenseFile>> snapshot) {
          var data = snapshot.data ?? [];
          return ListView.builder(
              shrinkWrap: true,
              itemCount: (data.length == 4) ? 4 : data.length + 1,
              itemBuilder: (BuildContext ctx, int index) {
                final value = (data.length > index) ? data[index] : null;
                return ListTile(
                  contentPadding: const EdgeInsets.all(0),
                  title: Text(AppLocalizations.of(context)
                      .translate("attachment_label")),
                  subtitle: (value != null) ? Text(value.filename) : Text(""),
                  trailing: IconButton(
                    color: Colors.red,
                    onPressed: () {
                      (value == null)
                          ? _handleType()
                          : _clearCachedFiles(index);
                    },
                    icon: Icon(
                      (value != null) ? Icons.cancel : Icons.attach_file,
                    ),
                  ),
                );
              });
        });
  }

  Widget _securityCode() {
    return StreamBuilder(
        stream: _viewModel.showSecurityCodeSectionStream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) return Container();
          if (snapshot.hasData && !snapshot.data!) return Container();
          if (!_viewModel.showSecurityCode) return Container();
          return TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                labelText: AppLocalizations.of(context)
                    .translate("security_code_label"),
                suffixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.red,
                )),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            controller: _codeController,
            validator: (String? value) =>
                validate(context, [() => isNotEmpty(value)]),
          );
        });
  }

  Widget _generateCode() {
    if (!_viewModel.showSecurityCode) return Container();
    return StreamBuilder(
        stream: _viewModel.showSecurityCodeSectionStream,
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData || snapshot.hasError) return Container();
          if (snapshot.hasData && !snapshot.data!) return Container();
          return Container(
              width: double.infinity,
              child: StreamBuilder(
                stream: _viewModel.validationCodeStream,
                builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                  var data = snapshot.data ?? false;
                  return ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.red)),
                    onPressed: !data && !_codeGenerated
                        ? () => _handleValidationKey()
                        : null,
                    child: const Text('Generar código'),
                  );
                },
              ));
        });
  }

  void _unFocusDropTextField() {
    FocusScope.of(context).requestFocus(FocusNode());
    FocusScope.of(context).unfocus();
  }

  Future _handleFormSubmit() async {
    if (_formKey.currentState!.validate()) {
      Utils.showConfirmAlert(context, 'Licencia',
          '¿Desea solicitar la licencia?', 'Aceptar', 'Cancelar', () async {
            Navigator.of(context, rootNavigator: true).pop();
            final result = await _viewModel.sendRequest(
                context,
                int.parse(widget.erpCode),
                widget.name,
                (_contactController.text.isEmpty) ? "" : _contactController.text,
                _codeController.text,
                double.parse(_quantityController.text),
                _val8,
                widget.license);
            if (result) {
              _viewModel.navigation.startStudentLicenseScreen(context);
              _viewModel.navigation.startLicenseListScreen(
                  context,
                  widget.studentId.toString(),
                  widget.erpCode,
                  widget.name,
                  widget.grade,
                  widget.parallel);
            }
          });
    }
  }

  Future<void> _handleStartDatePicker() async {
    var firstDate;
    try {
      firstDate = _viewModel.isTypeSickness()
          ? DateTime.now().subtract(Duration(days: 365))
          : null;
    } catch (e) {
      EasyLoading.showError("Por favor, seleccione antes el tipo de licencia");
      return;
    }
    DateTime? date = await _showDatePicker(
        initialDate: DateTime.now(), firstDate: firstDate);
    if (date == null) return;
    _startDateController.text = _formatDate(date);
    _viewModel.setStartDate(date);
    if (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_DAY) {
      _endDateController.text =
          _formatDate(_viewModel.getEndDate(_viewModel.getQuantity()));
      _viewModel.setEndDate(_viewModel.getEndDate(_viewModel.getQuantity()));
    } else if (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_HOUR) {
      DateTime newEndDate = date.add(Duration(hours: _viewModel.getQuantity()));
      _endDateController.text = _formatDate(newEndDate);
      _viewModel.setEndDate(newEndDate);
    } else {
      _endDateController.text = _formatDate(date);
      _viewModel.setEndDate(date);
    }
    if (_viewModel.isRangeDefined()) {
      _workDaysController.text =
          _viewModel.getWorkingDatesBetweenTwoDates().toStringAsFixed(1);
    }
  }

  Future<void> _handleEndDatePicker() async {
    print(
        "On handle end date picker... ${_viewModel.startDate?.toIso8601String()}");
    DateTime? date = await _showDatePicker(initialDate: _viewModel.startDate);
    if (date == null) return;
    _endDateController.text = _formatDate(date);
    _viewModel.setEndDate(date);

    if (_viewModel.isRangeDefined()) {
      _workDaysController.text =
          _viewModel.getWorkingDatesBetweenTwoDates().toStringAsFixed(1);
    }
  }

  Future<DateTime?> _showDatePicker(
      {DateTime? initialDate, DateTime? firstDate}) async {
    print("[ShowDatePicker] initial date: ${initialDate?.toIso8601String()}");
    print("[ShowDatePicker] first date: ${firstDate?.toIso8601String()}");
    DateTime? date = await showDatePicker(
      context: context,
      builder: (BuildContext ctx, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.red,
            colorScheme: ColorScheme.light(
              primary: Colors.red,
              secondary: Colors.red,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child ?? Container(),
        );
      },
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? initialDate ?? DateTime.now(),
      lastDate: DateTime(2030),
      helpText:
      AppLocalizations.of(context).translate("menu_title_license_requests"),
      cancelText: AppLocalizations.of(context).translate("alert_cancel_label"),
      confirmText: AppLocalizations.of(context).translate("alert_accept_label"),
    );
    if (date == null) return null;
    if (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_HOUR) {
      TimeOfDay initialTime = TimeOfDay.now();
      TimeOfDay? time = await showTimePicker(
        context: context,
        builder: (BuildContext ctx, Widget? child) {
          return Theme(
            data: ThemeData.light().copyWith(
              primaryColor: Colors.red,
              colorScheme: ColorScheme.light(
                primary: Colors.red,
                secondary: Colors.red,
              ),
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child ?? Container(),
          );
        },
        initialTime: TimeOfDay(hour: initialTime.hour, minute: 0),
        helpText: AppLocalizations.of(context)
            .translate("menu_title_license_requests"),
        cancelText:
        AppLocalizations.of(context).translate("alert_cancel_label"),
        confirmText:
        AppLocalizations.of(context).translate("alert_accept_label"),
      );
      if (time == null) return null;
      return DateTime(date.year, date.month, date.day, time.hour, 0);
    }
    //return DateTime(year, month, day, time.hour, time.minute);
    return DateTime(date.year, date.month, date.day);
  }

  String _formatDate(DateTime date) {
    Locale locale = Localizations.localeOf(context);
    final DateFormat formatter =
    (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_DAY)
        ? DateFormat.yMd(locale.toString())
        : DateFormat.yMd(locale.toString()).add_Hms();
    final String formatted = formatter.format(date.toLocal());
    return formatted;
  }

  void _handleType() async {
    bool hasPermission = await _checkAndRequestPermissions();
    if (!hasPermission) {
      EasyLoading.showError("No se pueden adjuntar archivos sin los permisos necesarios");
      return;
    }

    if (Platform.isIOS) {
      Alert(
          context: context,
          type: AlertType.info,
          style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
          title: "Seleccione el tipo de archivo",
          desc:
          'Escoja "Foto de Galeria" en caso de una foto tomada desde su telefono, caso contrario, escoja "Documento"',
          buttons: [
            DialogButton(
              child: Text(
                "Foto de Galeria",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _openImageExplorer();
                Navigator.of(context).pop();
              },
            ),
            DialogButton(
              child: Text(
                "Documento",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () async {
                await _openFileExplorer();
                Navigator.of(context).pop();
              },
            ),
          ]).show();
    } else
      _openFileExplorer();
  }

  Future<bool> _checkAndRequestPermissions() async {
    if (Platform.isIOS) {
      return true;
    }

    if (Platform.isAndroid) {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      int sdkInt = androidInfo.version.sdkInt;

      if (sdkInt >= 33) {
        // Android 13 (API 33) o superior usa permisos granulares
        Map<Permission, PermissionStatus> statuses = await [
          Permission.photos,
          Permission.videos,
        ].request();

        final status = statuses[Permission.photos]!.isGranted &&
            statuses[Permission.videos]!.isGranted;

        return status;
      } else {
        // Android 12 o inferior
        PermissionStatus status = await Permission.storage.request();
        return status.isGranted;
      }
    }

    return false;
  }

  Future<void> _openImageExplorer() async {
    setState(() => _loadingPath = true);
    try {
      XFile? result =
      await ImagePicker.platform.getImage(source: ImageSource.gallery);
      if (result != null) {
        File file = File(result.path);

        if (file.lengthSync() > 10000000) {
          EasyLoading.showInfo(
              "El tamaño del archivo es demasiado grande (${(file.lengthSync() / 10000000).toStringAsFixed(2)} MB)");
          return;
        }
        _viewModel.addFile(file);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    } catch (ex) {
      print("Error general: $ex");
      EasyLoading.showError("Ocurrió un problema al seleccionar la imagen");
    }finally {
      if (mounted) setState(() => _loadingPath = false);
    }
    /*
    TODO: Validar el tamanio del archivo max 20 Mb

     */
    // print("LICENSE SCREEN: " + _paths!.map((e) => e.size).toString());
    // print("LICENSE SCREEN: " + _paths![0].toString());
  }

  Future<void> _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        dialogTitle: "Seleccione su currículum",
        type: FileType.custom,
        allowedExtensions: ["png", "jpeg", "jpg", "pdf"],
        allowCompression: true,
        withData: false,
        withReadStream: true,
      );
      if (result != null) {
        if (result.files.single.path != null) {
          File file = File(result.files.single.path!);
          int fileSize = await file.length();

          if (fileSize > 10000000) {
            EasyLoading.showInfo(
                "El tamaño del archivo es demasiado grande (${(fileSize / 1000000).toStringAsFixed(2)} MB)");
            return;
          }

          _viewModel.addFile(file);
        } else {
          EasyLoading.showError("No se pudo acceder al archivo");
        }
      }
    } on PlatformException catch (e) {
      print("PlatformException: ${e.message}");
      EasyLoading.showError("Error al seleccionar archivo: ${e.message}");
    } catch (e) {
      print("Error general: $e");
      EasyLoading.showError("Ocurrió un problema al seleccionar el archivo");
    } finally {
      if (mounted) setState(() => _loadingPath = false);
    }
    /*
    TODO: Validar el tamanio del archivo max 20 Mb

     */
    // print("LICENSE SCREEN: " + _paths!.map((e) => e.size).toString());
    // print("LICENSE SCREEN: " + _paths![0].toString());
  }

  void _clearCachedFiles(int index) {
    // _viewModel.setFile(null);
    _viewModel.removeFile(index);
  }

  void _selectFolder() {
    FilePicker.platform.getDirectoryPath().then((value) {
      setState(() => _directoryPath = value);
    });
  }

  void _handleLicenseTypeChange(int type) {
    _viewModel.setLicenseType(type);
  }

  void _handleSubjectChange(String subject) {
    _viewModel.setSubject(subject);
  }

  void _handleReasonChange(String reason) {
    _viewModel.setReason(reason);
  }

  void _handlePeriodChange(int period) {
    _viewModel.setPeriod(period);
    if (period == LicenseScreenViewModel.PERIOD_DAY) {
      _viewModel.setQuantity(Tuple2<int, bool>(1, true));
      _quantityController.text = '1';
      _quantityLabel =
          AppLocalizations.of(context).translate("day_quantity_label");
      _startDateController.text = "";
      _endDateController.text = "";
    } else {
      _viewModel.setQuantity(Tuple2<int, bool>(1, true));
      _quantityController.text = '1';
      _quantityLabel =
          AppLocalizations.of(context).translate("hour_quantity_label");
      _startDateController.text = "";
      _endDateController.text = "";
    }
  }

  void _handleQuantityChange(int period) {
    _viewModel.setQuantity(Tuple2<int, bool>(period, true));
    // if (value == null || value.isEmpty) return;
    if (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_DAY) {
      final endDate = _viewModel.getEndDate(period);
      _endDateController.text = _formatDate(endDate);
      _viewModel.setEndDate(endDate);
    }
    if (_viewModel.getPeriod() == LicenseScreenViewModel.PERIOD_HOUR) {
      final endDate = _viewModel.getEndDate(1).add(Duration(hours: period));
      _endDateController.text = _formatDate(endDate);
      _viewModel.setEndDate(endDate);
    }
  }

  _handleValidationKey() async {
    try {
      await _viewModel.getValidationKey();
      EasyLoading.showSuccess(
        AppLocalizations.of(context)
            .translate("security_code_successfully_requested_message"),
        duration: Duration(seconds: 5),
      );
      _codeGenerated = true;
    } catch (e) {
      EasyLoading.showError(Utils.getMessageIdFromApiException(context, e));
    }
  }
}
