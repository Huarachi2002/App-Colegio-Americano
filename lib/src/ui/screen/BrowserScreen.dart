import 'package:back_button_interceptor/back_button_interceptor.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:colegio_americano/src/ui/view_model/BrowserScreenViewModel.dart';
import 'package:colegio_americano/src/ui/widgets/FullScreenLoadingWidget.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/RequestStatusEnum.dart';
import 'package:colegio_americano/src/utils/RootScreenMixin.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserScreen extends StatefulWidget {

  final String studentErpCode;

  BrowserScreen(this.studentErpCode);
  @override
  State<StatefulWidget> createState() => _BrowserScreenState();
}

class _BrowserScreenState extends State<BrowserScreen> with RootScreenMixin{
  BrowserScreenViewModel _viewModel = BrowserScreenViewModel();
  late final WebViewController controller;
  bool _isWebViewReady = false;
  bool _isPageLoading = true;

  @override
  void initState() {
    super.initState();
    BackButtonInterceptor.add(onBackPressed);

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              _isWebViewReady = true;
              _isPageLoading = true;
            });
          },
          onPageFinished: (String url) {
            Future.delayed(Duration(milliseconds: 100), () {
              if (mounted) {
                setState(() {
                  _isPageLoading = false;
                });
              }
            });
          },
        ),
      );

    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        _viewModel.getApiToken(context);
      }
    });
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
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          alignment: Alignment.centerLeft,
          onPressed: () async {
            _viewModel.navigation.navigateBack(context);
          },
        ),
        title: Text(AppLocalizations.of(context).translate('menu_title_report_card')),
      ),
      body: SafeArea(
        child: StreamBuilder<RequestStatus<String>>(
          initialData: RequestStatus.loadingState(),
          stream: _viewModel.browserStream,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return FullScreenLoadingWidget();
            }

            final requestStatus = snapshot.data!;

            switch (requestStatus.state) {
              case RequestStatusEnum.LOADING:
                return FullScreenLoadingWidget();

              case RequestStatusEnum.SUCCESS:
                return _buildWebViewWithPlaceholder(requestStatus.data ?? '');

              case RequestStatusEnum.ERROR:
                return _buildErrorWidget();

              default:
                return FullScreenLoadingWidget();
            }
          },
        ),
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error_outline, size: 60, color: Colors.red),
            SizedBox(height: 20),
            Text(
              "Error al cargar la boleta de calificaciones",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _viewModel.getApiToken(context);
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.red,
              ),
              child: Text('Reintentar'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildWebViewWithPlaceholder(String apiToken) {
    final url = '${SyncConstants.SERVER_URL}/api/report_card?erp_code=${widget.studentErpCode}&api_token=$apiToken';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.loadRequest(Uri.parse(url));
    });
    return Stack(
      children: [
        Visibility(
          visible: !_isWebViewReady || _isPageLoading,
          child: FullScreenLoadingWidget(),
        ),

        Opacity(
          opacity: (_isWebViewReady && !_isPageLoading) ? 1.0 : 0.0,
          child: WebViewWidget(
            controller: controller,
          ),
        ),
      ],
    );
  }
}