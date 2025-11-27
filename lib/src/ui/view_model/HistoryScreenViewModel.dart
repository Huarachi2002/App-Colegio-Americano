import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/request/StudentRequest.dart';
import 'package:colegio_americano/src/data/remote/response/ApiResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestHeaderResponse.dart';
import 'package:colegio_americano/src/data/remote/response/EquipmentRequestResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'dart:async';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:drift/drift.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:rxdart/rxdart.dart';

class HistoryScreenViewModel extends BaseViewModel {
  late BehaviorSubject<RequestStatus<List<EquipmentRequest>>>
      _streamController;
  late BehaviorSubject<bool> _enabledStreamController;
  bool enabled = false;

  HistoryScreenViewModel() : super() {
    _streamController =
    BehaviorSubject<RequestStatus<List<EquipmentRequest>>>();
    _enabledStreamController = BehaviorSubject<bool>();
  }

  @override
  void dispose() {
    _streamController.close();
    _enabledStreamController.close();
  }

  Function(RequestStatus<List<EquipmentRequest>>) get streamSink =>
      _streamController.sink.add;

  Stream<RequestStatus<List<EquipmentRequest>>> get stream =>
      _streamController.stream;

  Function(bool) get enableStreamSink => _enabledStreamController.sink.add;

  Stream<bool> get enableStream => _enabledStreamController.stream;

  Future<void> updateHistorical(String studentId, String erpCode) async {
    try {
      streamSink(RequestStatus.loadingState());

      var statusResponse = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getDebtStatus(erpCode)
      );
      print("Status: ${statusResponse.body}");
      final state = statusResponse.body?.data ?? '';
      if (state.contains('B')) {
        enableStreamSink(false);
        final message = statusResponse.body!.message;
        streamSink(RequestStatus.errorState(message));
        return;
      }

      enableStreamSink(true);

      StudentRequestBuilder requestBuilder = StudentRequestBuilder();
      requestBuilder.studentId = studentId;
      var response = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getEquipmentRequestHistorical(requestBuilder.build())
      );

      print("Equipment: ${response.body}");

      if (!response.isSuccessful) return;

      List<EquipmentRequestResponse> list = response.body!.data!.toList();

      await appDatabase.runInTransaction(() async {
        await appDatabase.equipmentRequestDetailDao.nukeTable();
        await appDatabase.equipmentRequestDao.nukeTable();

        List<Insertable<EquipmentRequestDetail>> details = [];
        List<Insertable<EquipmentRequest>> headers = [];

        list.forEach((equipmentRequest) {
          EquipmentRequestHeaderResponse header = equipmentRequest.header;
          Insertable<EquipmentRequest> insertHeaderTable =
              EquipmentRequestsCompanion.insert(
                  id: Value(header.id),
                  total: double.parse(header.total),
                  state: header.state,
                  priceListId: header.priceListId,
                  equipmentListId: header.equipmentListId,
                  studentId: header.studentId,
                  academicManagementId: header.academicManagementId,
                  createdBy: Value(header.createdBy),
                  date: Value(header.date),
                  employeeId: Value(header.employeeId),
                  erpCode: Value(header.erpCode),
                  token: Value(header.token),
                  createdAt: header.createdAt,
                  updatedAt: header.updatedAt);
          headers.add(insertHeaderTable);

          equipmentRequest.details.forEach((detail) {
            Insertable<EquipmentRequestDetail> insertDetailTable =
                EquipmentRequestDetailsCompanion.insert(
                    id: Value(detail.id),
                    quantity: double.parse(detail.quantity),
                    price: double.parse(detail.price),
                    subTotal: double.parse(detail.subtotal),
                    equipmentId: detail.productId,
                    createdBy: Value(detail.createdBy),
                    createdAt: Value(detail.createdAt),
                    updatedAt: Value(detail.updatedAt),
                    equipmentRequestId: detail.equipmentRequestId);
            details.add(insertDetailTable);
          });
        });
        await appDatabase.equipmentRequestDao.insertAll(headers);
        await appDatabase.equipmentRequestDetailDao.insertAll(details);

        await Future.delayed(Duration(milliseconds: 500));

        List<EquipmentRequest> requests = await appDatabase.equipmentRequestDao
            .getHeadersByStudentFuture(int.parse(studentId));

        streamSink(RequestStatus.successState(requests));
      });
    } catch (exception) {
      List<EquipmentRequest> requests = await appDatabase.equipmentRequestDao
          .getHeadersByStudentFuture(int.parse(studentId));

      streamSink(RequestStatus.successState(requests));
    }
  }

  Future<ApiResponse<String>?> getDebtStatus(String erpCode) async {
    try {
      var response = await Utils.retryFuture(
          SyncConstants.ATTEMPTS, () => apiService.getDebtStatus(erpCode)
      );
      if (response.error != null) throw Exception('Error al recuperar');
      return response.body;
    } catch (e) {
      var apiResponse = ApiResponseBuilder<String>();
      apiResponse.data = '';
      apiResponse.code = -1;
      apiResponse.message = '';
      return apiResponse.build();
    }
  }
}
