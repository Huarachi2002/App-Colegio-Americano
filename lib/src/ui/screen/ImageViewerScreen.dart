import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/ImageViewerScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:flutter/material.dart';

class ImageViewerScreen extends StatefulWidget {
  final int newId;
  final int newImageId;

  ImageViewerScreen(this.newId, this.newImageId);

  @override
  State<StatefulWidget> createState() => _ImageViewerScreenState();
}

class _ImageViewerScreenState extends State<ImageViewerScreen>
    with RootScreenMixin {
  ImageViewerScreenViewModel _viewModel = ImageViewerScreenViewModel();

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
      backgroundColor: Colors.black,
      appBar: _appBar(context),
      body: _bodyContent(context),
    );
  }

  _bodyContent(BuildContext context) {
    if (widget.newId != -1) {
      return _viewerImageNew();
    } else {
      return _viewerImageNewImage();
    }
  }

  _viewerImageNew() {
    return StreamBuilder(
        stream: _viewModel.appDatabase.newDao.getNewByIdAsStream(widget.newId),
        builder: (BuildContext context, AsyncSnapshot<New> snapshot) {
          if (!snapshot.hasData) return FullScreenLoadingWidget();
          var data = snapshot.data;
          if (data != null) {
            return Container(
              color: Colors.black,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _new(data),
                ),
              ),
            );
          } else {
            return FullScreenLoadingWidget();
          }
        });
  }

  _viewerImageNewImage() {
    return StreamBuilder(
        stream: _viewModel.appDatabase.newImageDao
            .getNewImageByIdAsStream(widget.newImageId),
        builder: (BuildContext context, AsyncSnapshot<NewImage> snapshot) {
          if (!snapshot.hasData) return FullScreenLoadingWidget();
          var data = snapshot.data;
          if (data != null) {
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _newImageV(data),
                ),
              ),
            );
          } else {
            return FullScreenLoadingWidget();
          }
        });
  }

  _newImageV(NewImage newI) {
    List<Widget> list = [
      _newImage(context, SyncConstants.SERVER_URL + '/' + (newI.path ?? "")),
    ];

    return list;
  }

  _new(New newData) {
    List<Widget> list = [
      _newImage(context, SyncConstants.SERVER_URL + '/' + (newData.path ?? "")),
    ];

    return list;
  }

  _newImage(BuildContext context, String url) {
    return Card(
      elevation: 2.0,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          color: Colors.black,
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.4,
            child: InteractiveViewer(
              child: Center(
                child: _getImage(url),
              ),
              minScale: 0.1,
              maxScale: 5.0,
            ),
          )),
    );
  }

  _getImage(String url,
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
      title: Text(
          AppLocalizations.of(context).translate('menu_title_image_viewer')),
    );
  }
}
