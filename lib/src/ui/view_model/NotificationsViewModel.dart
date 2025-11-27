import 'dart:async';

import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';

class NotificationsViewModel extends BaseViewModel {
  late StreamController<RequestStatus<List<NotificationResponse>>> notificationsStreamController;
  List<NotificationResponse> _notificationsList = [];

  NotificationsViewModel() : super() {
    notificationsStreamController = StreamController<RequestStatus<List<NotificationResponse>>>.broadcast();
  }

  Function(RequestStatus<List<NotificationResponse>>)
      get notificationsStreamSink => notificationsStreamController.sink.add;

  Stream<RequestStatus<List<NotificationResponse>>>
      get notificationsStream => notificationsStreamController.stream;

  @override
  void dispose() {
    notificationsStreamController.close();
  }

  getNotifications(BuildContext context) async {
    notificationsStreamSink(RequestStatus.loadingState());
    Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.getNotifications())
        .then((value) {
          var response = value.body!;
          print(response);
          var data = response.data!.toList();
          _notificationsList = data;
          notificationsStreamSink(RequestStatus.successState(_notificationsList));
        })
        .catchError((error) {
          print("Error obteniendo notificaciones: $error");
          notificationsStreamSink(RequestStatus.errorState('Error al obtener las notificaciones, por favor intente más tarde'));
        });
  }
}
