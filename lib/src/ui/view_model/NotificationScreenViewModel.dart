import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'dart:async';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/NotificationResponse.dart';

class NotificationScreenViewModel extends BaseViewModel {
  late StreamController<RequestStatus<NotificationResponse>>
      notificationStreamController;

  NotificationScreenViewModel() : super() {
    notificationStreamController =
        StreamController<RequestStatus<NotificationResponse>>.broadcast();
  }

  Function(RequestStatus<NotificationResponse>) get notificationsStreamSink =>
      notificationStreamController.sink.add;

  Stream<RequestStatus<NotificationResponse>> get notificationsStream =>
      notificationStreamController.stream;

  @override
  void dispose() {
    notificationStreamController.close();
  }

  getNotification(String id) {
    notificationsStreamSink(RequestStatus.loadingState());
    Utils.retryFuture(SyncConstants.ATTEMPTS, () => apiService.getNotificationById(id))
        .then((value) {
          var response = value.body!;
          var data = response.data!;
          notificationsStreamSink(RequestStatus.successState(data));
        })
        .catchError((error) {
          notificationsStreamSink(RequestStatus.errorState(''));
        });
  }
}
