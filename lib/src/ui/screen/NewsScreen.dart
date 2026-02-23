import 'dart:async';

import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/navigation/menu/DrawerMenu.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> with RootScreenMixin {
  late final WebViewController controller;
  bool _isLoading = true;

  static const String _schoolUrl = "https://sccs.edu.bo/";

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);

    // Inicializar el WebViewController
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(Colors.white)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            debugPrint('WebView: Cargando $url');
            if (mounted) {
              setState(() {
                _isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            debugPrint('WebView: Página cargada $url');
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            debugPrint('WebView Error: ${error.description}');
            if (mounted) {
              setState(() {
                _isLoading = false;
              });
            }
          },
        ),
      );

    // Cargar la URL después de que el widget esté construido
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadRequest(Uri.parse(_schoolUrl));
    });
  }

  @override
  void dispose() {
    BackButtonInterceptor.remove(onBackPressed);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Colors.white,
        appBar: AppBar(
          title:
              Text(AppLocalizations.of(context).translate('menu_title_news')),
        ),
        drawer: DrawerMenu(),
        body: Stack(
          children: [
            // WebView
            WebViewWidget(controller: controller),

            // Indicador de carga original
            if (_isLoading)
              Container(
                color: Colors.white,
                child: FullScreenLoadingWidget(),
              ),
          ],
        ),
      ),
      onWillPop: () async {
        if (await controller.canGoBack()) {
          await controller.goBack();
          return false;
        }
        Utils.showExitAlert(context);
        return true;
      },
    );
  }
}
