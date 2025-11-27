import 'package:cached_network_image/cached_network_image.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:flutter/material.dart';

import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/ui/view_model/NewScreenViewModel.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';

class NewScreen extends StatefulWidget {
  final int newId;

  NewScreen(this.newId);

  @override
  State<StatefulWidget> createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> with RootScreenMixin {
  NewScreenViewModel _viewModel = NewScreenViewModel();

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);
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

  _bodyContent(BuildContext context) {
    return StreamBuilder(
        stream: _viewModel.appDatabase.newDao.getNewByIdAsStream(widget.newId),
        builder: (BuildContext context, AsyncSnapshot<New> snapshot) {
          if (!snapshot.hasData) return FullScreenLoadingWidget();
          var data = snapshot.data;
          if (data != null) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  children: _new(data),
                ),
              ),
            );
          } else {
            return FullScreenLoadingWidget();
          }
        });
  }

  _new(New newData) {
    final ThemeData theme = Theme.of(context);
    theme.textTheme.displayLarge!.copyWith(color: Colors.white);
    final TextStyle descriptionStyle = theme.textTheme.titleMedium!;
    List<Widget> list = [
      _newName(newData.title ?? "", descriptionStyle),
      _newDateText(newData.updatedAt ?? ""),
      _newImage(context, SyncConstants.SERVER_URL + '/' + (newData.path ?? "")),
      _newDescriptionTitle(descriptionStyle),
      _newDescriptionText(newData.description ?? ""),
      Divider(
        thickness: 1.5,
        height: 2,
      ),
      _newImagesTitle(descriptionStyle),
      _newImagesList(),
      Container(
        height: 10,
      )
    ];

    return list;
  }

  _newImagesList() {
    return Container(
      child: StreamBuilder(
          stream: _viewModel.appDatabase.newImageDao
              .getNewImagesByIdAsStream(widget.newId),
          builder:
              (BuildContext context, AsyncSnapshot<List<NewImage>> snapshot) {
            if (!snapshot.hasData) return FullScreenLoadingWidget();
            var newImageData = snapshot.data;
            if (newImageData != null && newImageData.length > 0) {
              return _newCarouselImages(newImageData);
            } else {
              return Text(AppLocalizations.of(context).translate('images_no_data'));
            }
          }),
    );
  }

  _newCarouselImages(List<NewImage> newImageData) {
    double height = (MediaQuery.of(context).size.height) * 0.30;
    return CarouselSlider(
      options: CarouselOptions(height: height),
      items: newImageData.map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              child: GestureDetector(
                onTap: () {
                  _viewModel.navigation
                      .startImageViewerScreen(context, '-1', i.id.toString());
                },
                child:
                _getImage(SyncConstants.SERVER_URL + '/' + (i.path ?? "")),
              ),
            );
          },
        );
      }).toList(),
    );
  }

  _newName(String value, TextStyle descriptionStyle) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 6.0),
      child: Text(
        value,
        maxLines: 3,
        style: descriptionStyle.copyWith(
            fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black87),
      ),
    );
  }

  _newImage(BuildContext context, String url) {
    return Card(
      elevation: 2.0,
      child: Container(
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: GestureDetector(
              onTap: () {
                _viewModel.navigation.startImageViewerScreen(
                    context, widget.newId.toString(), '-1');
              },
              child: _getImage(url),
            ),
          )),
    );
  }

  _newDescriptionTitle(TextStyle descriptionStyle) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: DefaultTextStyle(
        style: descriptionStyle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                AppLocalizations.of(context).translate('description_label'),
                style: descriptionStyle.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _newImagesTitle(TextStyle descriptionStyle) {
    return Container(
      padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: DefaultTextStyle(
        style: descriptionStyle,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 8.0),
              child: Text(
                AppLocalizations.of(context).translate('images_label'),
                style: descriptionStyle.copyWith(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _newDateText(String text) {
    return Container(
      padding: const EdgeInsets.fromLTRB(20.0, 10.0, 10.0, 10.0),
      child: Text(
        'Fecha: ' + text,
        maxLines: 2,
        style: TextStyle(fontSize: 13.0, color: Colors.black38),
      ),
    );
  }

  _newDescriptionText(String text) {
    return Html(
      data: text,
      onLinkTap: (url, attributes, element) {
        if (url != null) {
          _viewModel.navigation.startBrowserScreen(context, url);
        }
      },
    );
  }

  _getImage(String? url,
      {boxType = BoxFit.contain, defaultAsset = 'assets/no_image.png'}) {
    if (url == null)
      return Image.asset(
        defaultAsset,
        fit: boxType,
      );
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      placeholder: (context, url) => Image.asset(
        defaultAsset,
        fit: BoxFit.scaleDown,
      ),
      errorWidget: (context, url, error) => Image.asset(
        defaultAsset,
        fit: BoxFit.scaleDown,
      ),
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
      title: Text(AppLocalizations.of(context).translate('menu_title_new')),
    );
  }
}
