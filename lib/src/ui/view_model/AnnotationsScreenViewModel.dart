import 'dart:async';

import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/local/pojo/AbsenceTypesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AbsencesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationTypesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationsAndAbsencesPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/AnnotationsPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/ChildrensPojo.dart';
import 'package:colegio_americano/src/data/local/pojo/InformationsPojo.dart';

import 'package:colegio_americano/src/data/local/pojo/LastAbsenceDatePojo.dart';
import 'package:colegio_americano/src/data/local/pojo/LastAnnotationDatePojo.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/AnnotationResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/material.dart';
import 'package:drift/drift.dart';

class AnnotationsScreenViewModel extends BaseViewModel {
  late StreamController<RequestStatus<AnnotationsAndAbsencesPojo>>
      annotationsStreamController;

  AnnotationsScreenViewModel() : super() {
    annotationsStreamController =
        StreamController<RequestStatus<AnnotationsAndAbsencesPojo>>.broadcast();
  }

  Function(RequestStatus<AnnotationsAndAbsencesPojo>)
      get annotationsStreamSink => annotationsStreamController.sink.add;

  Stream<RequestStatus<AnnotationsAndAbsencesPojo>> get annotationsStream =>
      annotationsStreamController.stream;

  @override
  void dispose() {
    annotationsStreamController.close();
  }

  getAnnotation(BuildContext context, String erpCode, int studentId) async {
    annotationsStreamSink(RequestStatus.loadingState());
    Utils.retryFuture(
            SyncConstants.ATTEMPTS, () async => await apiService.annotation(erpCode))
        .then((response) async {
      if (response.isSuccessful) {
        AnnotationResponse annotationResponse = response.body!.data!;
        await _saveInDataBase(annotationResponse, studentId);
        //await _insertInDataBase(studentId);
        await _getAnnotations(studentId);
      }
    }).catchError((error) async {
      print(error);
    });
  }

  _saveInDataBase(AnnotationResponse annotationResponse, int studentId) async {
    try {
      await appDatabase.runInTransaction(() async {
        List<Insertable<Annotation>> annotationList = [];
        annotationResponse.annotations.forEach((item) {
          Insertable<Annotation> annotationInsertable =
              AnnotationsCompanion.insert(
            id: Value(item.id),
            date: Value(item.date),
            type: Value(item.type),
            subject: Value(item.subject),
            description: Value(item.text),
            studentId: Value(studentId),
            createdAt: Value(item.createdAt),
          );
          annotationList.add(annotationInsertable);
        });
        await appDatabase.annotationDao.deleteAnnotationById(studentId);
        await appDatabase.annotationDao.insertAll(annotationList);

        List<Insertable<Absence>> absenceList = [];
        annotationResponse.absences.forEach((item) {
          Insertable<Absence> absenceInsertable = AbsencesCompanion.insert(
            id: Value(item.id),
            date: Value(item.date),
            startTime: Value(item.startTime),
            endTime: Value(item.endTime),
            type: Value(item.type),
            time: Value(item.time),
            absenceGroup: Value(item.absenceGroup),
            studentId: Value(studentId),
            createdAt: Value(item.createdAt),
          );
          absenceList.add(absenceInsertable);
        });
        await appDatabase.absenceDao.deleteAbsenceById(studentId);
        await appDatabase.absenceDao.insertAll(absenceList);
      });
    } catch (exception) {
      print(exception);
      return false;
    }
  }

  _getAnnotations(int studentId) async {
    List<AnnotationTypesPojo> annotationTypes = await appDatabase.annotationDao
        .getAnnotationTypesByStudentIdAsFuture(studentId);
    List<AbsenceTypesPojo> absenceTypes = await appDatabase.absenceDao
        .getAbsenceTypesByStudentIdAsFuture(studentId);

    List<Annotation> annotationsAll = await appDatabase.annotationDao
        .getAnnotationsByStudentIdAsFuture(studentId);
    List<Absence> absencesAll =
        await appDatabase.absenceDao.getAbsencesByStudentIdAsFuture(studentId);

    // LastAnnotationDatePojo lastAnnotationDate = await appDatabase.annotationDao
    //     .getLastAnnotationDateByStudentIdAsFuture(studentId);
    // LastAbsenceDatePojo lastAbsenceDate = await appDatabase.absenceDao
    //     .getLastAbsenceDateByStudentIdAsFuture(studentId);

    AnnotationsPojo annotationsPojo =
        _makeAnnotations(annotationTypes, annotationsAll);
    AbsencesPojo absencesPojo = _makeAbsences(absenceTypes, absencesAll);

    AnnotationsAndAbsencesPojo annotationsAndAbsencesPojo =
        AnnotationsAndAbsencesPojo(annotationsPojo, absencesPojo);

    annotationsStreamSink(
        RequestStatus.successState(annotationsAndAbsencesPojo));
  }

  String _convertToTime(int value) {
    var time = value.toString();
    if (time.length == 3) {
      return '0' + time.substring(0, 1) + ':' + time.substring(1);
    }
    return time.substring(0, 2) + ':' + time.substring(2);
  }

  Future _cleanTables() {
    return Future.wait([
      appDatabase.annotationDao.nukeTable(),
      appDatabase.absenceDao.nukeTable(),
    ]);
  }

  _insertInDataBase(int studentId) {
    List<Insertable<Annotation>> annotationList = [];
    Insertable<Annotation> annotationInsertable = AnnotationsCompanion.insert(
      id: Value(2),
      date: Value("item.date"),
      type: Value("item.type"),
      subject: Value("item.subject"),
      description: Value("item.text"),
      studentId: Value(studentId),
      createdAt: Value("item.createdAt"),
    );
    annotationList.add(annotationInsertable);
    appDatabase.annotationDao.insertAll(annotationList);
  }

  AnnotationsPojo _makeAnnotations(List<AnnotationTypesPojo> annotationTypes,
      List<Annotation> annotationsAll) {
    List<ChildrensPojo> childrensPojo = [];
    annotationTypes.forEach((element) {
      List<InformationsPojo> informationsPojo = [];
      annotationsAll.forEach((annotation) {
        String title = "";
        String information = "";
        if (annotation.type == element.type) {
          //title = 'Fecha: ' + annotation.date;
          //if (annotation.createdAt == lastAnnotationDate.createdAt) {
          title = '<h2><strong>Fecha: ${annotation.date}</strong></h2>';
          //}
          information = '<p>${annotation.description}</p>';
          InformationsPojo informationPojo =
              InformationsPojo(title, information);
          informationsPojo.add(informationPojo);
        }
      });
      ChildrensPojo childrenPojo =
          ChildrensPojo(element.type, informationsPojo);
      childrensPojo.add(childrenPojo);
    });

    String tituloAnnotation =
        annotationTypes.length > 0 ? "Anotaciones" : "Sin anotaciones";
    AnnotationsPojo annotationsPojo =
        AnnotationsPojo(tituloAnnotation, childrensPojo);

    return annotationsPojo;
  }

  AbsencesPojo _makeAbsences(
      List<AbsenceTypesPojo> absenceTypes, List<Absence> absencesAll) {
    List<ChildrensPojo> childrensPojo = [];
    absenceTypes.forEach((element) {
      List<InformationsPojo> informationsPojo = [];
      absencesAll.forEach((absence) {
        String title = "";
        String information = "";
        if (absence.type == element.type) {
          //title = 'Fecha: ' + absence.date;
          //if (absence.createdAt == lastAbsenceDate.createdAt) {
          title = '<h2><strong>Fecha: ${absence.date}</strong></h2>';
          //}
          information = '<p>Periodo: ' +
              _convertToTime(absence.startTime!) +
              '-' +
              _convertToTime(absence.endTime!) +
              '</p>' +
              '<p>Materia-Grupo: ' +
              (absence.absenceGroup ?? "") +
              '</p>';
          InformationsPojo informationPojo =
              InformationsPojo(title, information);
          informationsPojo.add(informationPojo);
        }
      });
      ChildrensPojo childrenPojo =
          ChildrensPojo(element.type, informationsPojo);
      childrensPojo.add(childrenPojo);
    });

    String titleAbsences = absenceTypes.length > 0
        ? "Ausencias y Retrasos"
        : "Sin ausencias y retrasos";
    AbsencesPojo absencesPojo = AbsencesPojo(titleAbsences, childrensPojo);

    return absencesPojo;
  }
}
