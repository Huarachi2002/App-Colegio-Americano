import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/exception/ApiException.dart';
import 'package:colegio_americano/src/data/remote/request/LicenseRequest.dart';
import 'package:colegio_americano/src/data/remote/response/AttachmentResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseListResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseResponse.dart';
import 'package:colegio_americano/src/data/remote/response/LicenseValidationKeyResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:tuple/tuple.dart';
import 'package:url_launcher/url_launcher.dart';

class LicenseScreenViewModel extends BaseViewModel {
  static final int PERIOD_DAY = 1;
  static final int PERIOD_HOUR = 2;

  bool _isRequestingKey = false;

  late int _licenseType;
  late int _period = 0;
  String _subject = "";
  late String _reason;
  late DateTime? _startDate;
  late DateTime? _endDate;
  File? _file;
  String _filename = "";
  late int _quantity = 0;
  String validationKey = "";
  String _validationCode = "";
  List<LicenseFile> files = [];
  bool showSecurityCode = true;
  late StreamController<String> _fileNameStreamController;
  late StreamController<int> _licenseTypeStreamController;
  late StreamController<int> _periodStreamController;
  late StreamController<String> _subjectStreamController;
  late StreamController<String> _reasonStreamController;
  late StreamController<Tuple2<int, bool>> _quantityStreamController;
  late StreamController<bool> _validationCodeStreamController;
  late StreamController<String> _validationKeyCodeStreamController;
  late StreamController<List<LicenseFile>> _filesStreamController;
  late StreamController<bool> _showSecurityCodeSectionStreamController;

  Stream<bool> get showSecurityCodeSectionStream =>
      _showSecurityCodeSectionStreamController.stream;

  Function(bool) get showSecurityCodeSectionStreamSink =>
      _showSecurityCodeSectionStreamController.sink.add;

  Stream<List<LicenseFile>> get filesStream => _filesStreamController.stream;

  Function(List<LicenseFile>) get filesStreamSink =>
      _filesStreamController.sink.add;

  Stream<String> get validationKeyCodeStream =>
      _validationKeyCodeStreamController.stream;

  Function(String) get validationKeyCodeStreamSink =>
      _validationKeyCodeStreamController.sink.add;

  Stream<bool> get validationCodeStream =>
      _validationCodeStreamController.stream;

  Function(bool) get validationCodeStreamSink =>
      _validationCodeStreamController.sink.add;

  Stream<Tuple2<int, bool>> get quantityStream =>
      _quantityStreamController.stream;

  Function(Tuple2<int, bool>) get quantityStreamSink =>
      _quantityStreamController.sink.add;

  Stream<String> get reasonStream => _reasonStreamController.stream;

  Function(String) get reasonStreamSink => _reasonStreamController.sink.add;

  Stream<String> get subjectStream => _subjectStreamController.stream;

  Function(String) get subjectStreamSink => _subjectStreamController.sink.add;

  Stream<int> get periodStream => _periodStreamController.stream;

  Function(int) get periodStreamSink => _periodStreamController.sink.add;

  Stream<int> get licenseTypeStream => _licenseTypeStreamController.stream;

  Function(int) get licenseTypeStreamSink =>
      _licenseTypeStreamController.sink.add;

  Stream<String> get fileNameStream => _fileNameStreamController.stream;

  Function(String) get fileNameStreamSink => _fileNameStreamController.sink.add;

  LicenseScreenViewModel() : super() {
    _fileNameStreamController = StreamController<String>.broadcast();
    _licenseTypeStreamController = StreamController<int>.broadcast();
    _periodStreamController = StreamController<int>.broadcast();
    _subjectStreamController = StreamController<String>.broadcast();
    _reasonStreamController = StreamController<String>.broadcast();
    _quantityStreamController = StreamController<Tuple2<int, bool>>.broadcast();
    _validationCodeStreamController = StreamController<bool>.broadcast();
    _validationKeyCodeStreamController = StreamController<String>.broadcast();
    _filesStreamController = StreamController<List<LicenseFile>>.broadcast();
    _showSecurityCodeSectionStreamController =
        StreamController<bool>.broadcast();
  }

  @override
  void dispose() {
    _fileNameStreamController.close();
    _licenseTypeStreamController.close();
    _periodStreamController.close();
    _subjectStreamController.close();
    _reasonStreamController.close();
    _quantityStreamController.close();
    _validationCodeStreamController.close();
    _validationKeyCodeStreamController.close();
    _filesStreamController.close();
    _showSecurityCodeSectionStreamController.close();
  }

  setStartDate(DateTime date) => _startDate = date;

  setEndDate(DateTime date) => _endDate = date;

  bool isRangeDefined() => _startDate != null && _endDate != null;

  DateTime? get startDate =>
      _startDate; // todo: check if saturday it's considered as half-day-of-work

  double getWorkingDatesBetweenTwoDates() {
    var start = _startDate!;
    var end = _endDate!;
    if (start.compareTo(end) == 0) {
      return 0.0;
    }

    int i = 0;
    double workDays = 0.0;
    do {
      if (start.weekday != DateTime.sunday &&
          start.weekday != DateTime.saturday) {
        workDays += 1.0;
      }
      start = start.add(Duration(days: 1));
      i++;
    } while (start.compareTo(end) == -1 && i < 100);
    return workDays;
  }

  DateTime getEndDate(int quantity) {
    var end = _startDate!;
    int i = 1;
    while (i < quantity) {
      end = end.add(Duration(days: 1));
      if (end.weekday != DateTime.sunday && end.weekday != DateTime.saturday) {
        i++;
      }
    }
    return end;
  }

  sendRequest(
      BuildContext context,
      int studentId,
      String name,
      String contact,
      String code,
      double quantity,
      bool test,
      LicenseListResponse? licenseResponse) async {
    try {
      if (_period == PERIOD_DAY && quantity > 3 && files.isEmpty) {
        validationCodeStreamSink(false);
        _isRequestingKey = false;
        EasyLoading.showError("Por favor, adjunte por lo menos un archivo");
        return false;
      }
      EasyLoading.show(status: 'Enviando...');
      DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ss");
      String date = dateFormat.format(DateTime.now());
      int cantidadPeriodo = (_period == 1)
          ? quantity.toInt()
          : _endDate!.difference(_startDate!).inHours;

      if (cantidadPeriodo < 1) {
        String message = _period == 0
            ? "La cantidad de días ingresados no puede ser menor a 1"
            : "La cantidad de horas ingresadas no puede ser menor a 1";
        EasyLoading.showError(message);
        return false;
      }

      print(validationCodeStream);
      String entityBody = "";
      entityBody = "{" +
          "\"id\": ${(licenseResponse == null) ? "null" : licenseResponse.id}" +
          ",\"fecha\":\"$date\"" +
          ",\"codigoEstudiante\": $studentId" +
          ",\"nombreEstudiante\": \"$name\"" +
          ",\"tipoLicencia\": $_licenseType" +
          ",\"tipoPeriodo\": $_period" +
          ",\"cantidadPeriodo\": $cantidadPeriodo" +
          ",\"fechaInicial\": \"$_startDate\"" +
          ",\"tieneExamen\": $test" +
          ",\"examenDe\": \"${(_subject == null) ? "" : _subject}\"" +
          ",\"motivo\": \"$_reason\"" +
          ",\"solicitante\": \"$contact\"" +
          ",\"motivoDelRechazo\": null" +
          ",\"llaveValidacion\": \"$validationKey\"" +
          ",\"codigoValidacion\": \"$code\""
              "}";
      LicenseRequestBuilder licenseRequestBuilder = LicenseRequestBuilder();
      licenseRequestBuilder.entity = entityBody;

      print("[request] body ${licenseRequestBuilder.build()}");
      List<String?> newFiles = [];
      List<String?> existingFiles = [];
      for (final file in this.files) {
        if (file.id != null) {
          existingFiles.add(file.toString());
        } else {
          newFiles.add(file.file!.path);
        }
      }
      int lengthnewFiles = newFiles.length;
      int lengthExistingFiles = existingFiles.length;
      print("LONGITUD NF " + lengthnewFiles.toString());
      print("LONGITUD EF " + existingFiles.toString());
      print(newFiles.toString());
      Response<LicenseResponse> response;
      if (licenseResponse == null) {
        //creacion
        print("licenseApiService: $licenseApiService");
        print("newFiles: $newFiles");
        print("existingFiles: $existingFiles");
        print("lengthnewFiles: $lengthnewFiles");
        print("lengthExistingFiles: $lengthExistingFiles");
        response = await Utils.retryFuture(
            SyncConstants.ATTEMPTS,
            () => licenseApiService.setLicense(
                entityBody,
                (lengthnewFiles >= 1) ? newFiles[0] : null,
                (lengthnewFiles >= 2) ? newFiles[1] : null,
                (lengthnewFiles >= 3) ? newFiles[2] : null,
                (lengthnewFiles >= 4) ? newFiles[3] : null,
                (lengthExistingFiles >= 1) ? existingFiles[0] : null,
                (lengthExistingFiles >= 2) ? existingFiles[1] : null,
                (lengthExistingFiles >= 3) ? existingFiles[2] : null,
                (lengthExistingFiles >= 4) ? existingFiles[3] : null));
      } else {
        //edicion
        response = await Utils.retryFuture(
            SyncConstants.ATTEMPTS,
            () => licenseApiService.updateLicense(
                entityBody,
                (lengthnewFiles >= 1) ? newFiles[0] : null,
                (lengthnewFiles >= 2) ? newFiles[1] : null,
                (lengthnewFiles >= 3) ? newFiles[2] : null,
                (lengthnewFiles >= 4) ? newFiles[3] : null,
                (lengthExistingFiles >= 1) ? existingFiles[0] : null,
                (lengthExistingFiles >= 2) ? existingFiles[1] : null,
                (lengthExistingFiles >= 3) ? existingFiles[2] : null,
                (lengthExistingFiles >= 4) ? existingFiles[3] : null));
      }

      print("[response] body ${response.body}");
      print("[response] error ${response.error}");
      print("[response] error ${response.statusCode}");
      print("[response] error ${response.base.request!.headers}");

      if (response.isSuccessful) {
        EasyLoading.showSuccess("Se envió correctamente");
        return true;
      } else {
        print(jsonDecode(response.error.toString()));
        String errorDetail = jsonDecode(response.error.toString())[0]['detail'];
        if (errorDetail.contains("Codigo de Confirm"))
          EasyLoading.showError(
              "Error al digitar el código, revise el correo enviado a la cuenta familiar");
        else {
          EasyLoading.dismiss();
          handleLicenceErrorAlert(context, errorDetail);
        }
        validationCodeStreamSink(false);
        _isRequestingKey = false;
        return false;
      }
    } catch (e) {
      print("[response] error ${e}");
      validationCodeStreamSink(false);
      _isRequestingKey = false;
      EasyLoading.showError("Ocurrió un error");
      return false;
    }
  }

  Future getValidationKey() async {
    try {
      // Valida que no se haya realizado un click
      if (_isRequestingKey) return false;

      // Setea variables para que no realice la petición nuevamente
      _isRequestingKey = true;
      validationCodeStreamSink(true);

      // Solicita código de validación
      Response<LicenseValidationKeyResponse> response =
          await licenseApiService.getValidationKey();

      if (!response.isSuccessful) throw new Exception();
      print("[VALIDATION KEY] Body: ${response.bodyString}");
      print("[VALIDATION KEY] Error: ${response.error}");
      validationKey = response.body!.key;
    } catch (e) {
      print("[VALIDATION KEY] Exception: $e");
      _isRequestingKey = false;
      validationCodeStreamSink(false);
      throw e;
    }
  }

  void setLicenseType(int type) {
    _licenseType = type;
    licenseTypeStreamSink(type);
  }

  void setPeriod(int period) {
    _period = period;
    periodStreamSink(period);
  }

  void setSubject(String subject) {
    _subject = subject;
    subjectStreamSink(subject);
  }

  void setReason(String reason) {
    _reason = reason;
    reasonStreamSink(reason);
  }

  void setFile(File? file) {
    _file = file;
    _filename = file == null ? "" : file.path.split("/").last;
    fileNameStreamSink(file == null ? "" : file.path.split("/").last);
  }

  void setFileName(String name) {
    _filename = name;
    fileNameStreamSink(name);
  }

  void setQuantity(Tuple2<int, bool> tuple) {
    _quantity = tuple.item1;
    quantityStreamSink(tuple);
  }

  int getQuantity() {
    return _quantity;
  }

  int getPeriod() {
    return _period;
  }

  void setValidationKeyCode(String code) {
    _validationCode = code;
    validationKeyCodeStreamSink(code);
  }

  void setLicenseFiles(List<AttachmentResponse> attachments) async {
    print(attachments);
    for (AttachmentResponse attachment in attachments) {
      LicenseFile licenseFile = new LicenseFile();
      licenseFile.filename = attachment.fileName;
      licenseFile.id = attachment.id;
      files.add(licenseFile);
    }
    await Future.delayed(Duration(milliseconds: 500));
    filesStreamSink(files);
  }

  void addFile(File file) {
    var licenceFile = LicenseFile()
      ..file = file
      ..filename = file.path;
    files.add(licenceFile);
    filesStreamSink(files);
  }

  void removeFile(int index) {
    files.removeAt(index);
    filesStreamSink(files);
  }

  bool isTypeSickness() {
    // TODO: Corregir el código hard-codeado
    print("Is type sickness? " + SyncConstants.LICENSE_TYPES[_licenseType - 1]);
    return SyncConstants.LICENSE_TYPES[_licenseType - 1] == "Enfermedad";
  }

  void setShowSecurityCodeSection(bool value) {
    showSecurityCodeSectionStreamSink(value);
  }

  void handleLicenceErrorAlert(BuildContext context, String error) {
    Alert(
        context: context,
        type: AlertType.error,
        style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
        title: "Ha ocurrido un error",
        desc:
            '"${error}"\n\n Puede intentar realizar la solicitud desde la web: http://inscripciones.ds-santacruz.bo"',
        buttons: [
          DialogButton(
            child: Text(
              "Ir al sitio web",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              await _openWebSiteLink();
              Navigator.of(context).pop();
            },
          ),
          DialogButton(
            child: Text(
              "Ir atras",
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              Navigator.of(context).pop();
            },
          ),
        ]).show();
  }

  _openWebSiteLink() async {
    String url = 'http://inscripciones.ds-santacruz.bo';
    await launch(url);
  }
}

class LicenseFile {
  int? id;
  late String filename;
  File? file;

  LicenseFile();

  @override
  String toString() {
    return "{\"id\": $id" + ",\"fileName\": \"$filename\" }";
  }
}
