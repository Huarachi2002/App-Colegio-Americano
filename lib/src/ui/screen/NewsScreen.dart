import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/NewsResponse.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/menu/DrawerMenu.dart';
import 'package:colegio_americano/src/ui/view_model/NewsScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/ui/widgets/RetryErrorMessageWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:html/parser.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with RootScreenMixin {
  NewsScreenViewModel _viewModel = NewsScreenViewModel();
  ScrollController _scrollController = ScrollController();

  bool _isWebViewReady = false;
  bool _isPageLoading = true;
  String _webViewUrl = '';

  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);

    Future.delayed(Duration(milliseconds: 50), () {
      if (mounted) _viewModel.getTypes(context);
    });

    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) _viewModel.getNews(context);
    });

    _loadInitialUrl();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent - 200) {
        _viewModel.getNews(context);
      }
    });

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url){
            setState(() {
              _isWebViewReady = true;
              _isPageLoading = true;
            });
          },
          onPageFinished: (String url) {
            Future.delayed(Duration(milliseconds: 100), (){
              if(mounted) {
                setState(() {
                  _isPageLoading = false;
                });
              }
            });
          }
        )
      );
  }

  Future<void> _loadInitialUrl() async {
    try {
      final url = await _viewModel.loginPreference.newsUrl;
      if (mounted) {
        final safeUrl = "https://sccs.edu.bo/";
        setState(() {
          _webViewUrl = safeUrl;
        });
        controller.loadRequest(Uri.parse(safeUrl));
      }
    } catch (e) {
      print("Error cargando URL inicial: $e");
      if (mounted) {
        setState(() {
          _webViewUrl = "https://sccs.edu.bo/";
        });
        controller.loadRequest(Uri.parse("https://sccs.edu.bo/"));
      }
    }
  }

  @override
  void dispose() {
    _viewModel.dispose();
    BackButtonInterceptor.remove(onBackPressed);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white, // Color de fondo por defecto
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate('menu_title_news')),
        ),
        drawer: DrawerMenu(),
        body: _bodyContent(),
      ),
      onWillPop: () async {
        if (controller != null && await controller!.canGoBack()) {
          await controller!.goBack();
          return false;
        }
        Utils.showExitAlert(context);
        return true;
      },
    );
  }

  Widget _bodyContent() {
    if (_webViewUrl.isEmpty) {
      return FullScreenLoadingWidget();
    }

    // Una vez que tenemos la URL, usar un stack para manejar transiciones
    return Stack(
      children: [
        Visibility(
          visible: !_isWebViewReady || _isPageLoading,
          child: FullScreenLoadingWidget(),
        ),

        // WebView que se mostrará gradualmente cuando esté listo
        Opacity(
          opacity: (_isWebViewReady && !_isPageLoading) ? 1.0 : 0.0,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ],
    );
  }

  FutureOr<NavigationDecision> navigationDelegateHandler(
      NavigationRequest request) {
    if (request.url.endsWith('.pdf')) {
      _viewModel.savePdf(request.url);
    }
    return NavigationDecision.navigate;
  }
}
