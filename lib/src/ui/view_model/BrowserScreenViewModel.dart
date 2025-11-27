import 'dart:async';

import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';

class BrowserScreenViewModel extends BaseViewModel {
  late StreamController<RequestStatus<String>> browserStreamController;

  BrowserScreenViewModel() : super() {
    browserStreamController =
        StreamController<RequestStatus<String>>.broadcast();
  }

  Function(RequestStatus<String>) get browserStreamSink =>
      browserStreamController.sink.add;

  Stream<RequestStatus<String>> get browserStream =>
      browserStreamController.stream;

  @override
  void dispose() {
    browserStreamController.close();
  }

  getApiToken(BuildContext context) async {
    browserStreamSink(RequestStatus.loadingState());
    loginPreference.apiToken.then((value) {
      browserStreamSink(RequestStatus.successState(value));
    }).catchError((error) {
      browserStreamSink(RequestStatus.errorState(
          Utils.getMessageIdFromApiException(context, 'Token no obtenido')));
    });
  }
}
