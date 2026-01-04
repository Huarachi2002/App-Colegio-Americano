import 'dart:async';
import 'dart:io';
import 'package:colegio_americano/src/data/local/AppDatabase.dart';
import 'package:colegio_americano/src/data/remote/configuration/SyncConstants.dart';
import 'package:colegio_americano/src/data/remote/response/TypesResponse.dart';
import 'package:colegio_americano/src/ui/view_model/BaseViewModel.dart';
import 'package:colegio_americano/src/data/remote/response/NewsResponse.dart';
import 'package:colegio_americano/src/utils/RequestStatus.dart';
import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:colegio_americano/src/data/remote/configuration/Menu.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:drift/drift.dart';
import 'package:open_file_plus/open_file_plus.dart';
import 'package:path_provider/path_provider.dart';

class NewsScreenViewModel extends BaseViewModel {
  bool _isMounted = true;
  late StreamController<RequestStatus<List<NewsResponse>>> newsStreamController;
  late StreamController<RequestStatus<List<TypesResponse>>>
      typesStreamController;
  List<NewsResponse> _newsList = [];
  String? _lastDate;
  bool isLoading = false;

  @override
  void dispose() {
    _isMounted = false;
    newsStreamController.close();
    typesStreamController.close();
  }

  NewsScreenViewModel() : super() {
    newsStreamController =
        StreamController<RequestStatus<List<NewsResponse>>>.broadcast();

    /*newsStreamController =
    StreamController<RequestStatus<List<New>>>.broadcast();*/

    typesStreamController =
        StreamController<RequestStatus<List<TypesResponse>>>.broadcast();
  }

  Function(RequestStatus<List<NewsResponse>>) get newsStreamSink =>
      newsStreamController.sink.add;

  Stream<RequestStatus<List<NewsResponse>>> get newsStream =>
      newsStreamController.stream;

  /*Function(RequestStatus<List<New>>) get newsListStreamSink => newsStreamController.sink.add;
  Stream<RequestStatus<List<New>>> get newsListStream => newsStreamController.stream;*/

  Function(RequestStatus<List<TypesResponse>>) get typesStreamSink =>
      typesStreamController.sink.add;

  Stream<RequestStatus<List<TypesResponse>>> get typesStream =>
      typesStreamController.stream;

  getTypes(BuildContext context) async {
    typesStreamSink(RequestStatus.loadingState());
    if (_lastDate == null) {
      await _cleanTables();
    }
    Utils.retryFuture(SyncConstants.ATTEMPTS, () => apiService.getTypes())
        .then((response) {
      List<TypesResponse> typesResponseList = response.body!.data!.toList();
      _saveTypesInDataBase(typesResponseList);
      typesStreamSink(RequestStatus.successState(typesResponseList));
    }).catchError((error) {
      /*MANDAR LO QUE HAY EN LA BD*/
      print(error);
      if (_isMounted) {
        typesStreamSink(RequestStatus.errorState(
            Utils.getMessageIdFromApiException(context, error)));
      }
    });
  }

  getNews(BuildContext context) async {
    if (_lastDate == null) {
      newsStreamSink(RequestStatus.loadingState());
      await _cleanTables();
    }
    Utils.retryFuture(
            SyncConstants.ATTEMPTS, () => apiService.getNews(_lastDate))
        .then((response) async {
      List<NewsResponse> newsResponseList = response.body!.data!.toList();
      _lastDate = newsResponseList[newsResponseList.length - 1].updatedAt;
      _newsList.addAll(newsResponseList);
      await _saveNewsInDatabase(newsResponseList);

      newsStreamSink(RequestStatus.successState(_newsList));
    }).catchError((error) async {
      print(error);
      List<New> news = await appDatabase.newDao.getNewAsFuture();
      news.forEach((element) {});
      if (news.length > 0) {
        //newsListStreamSink(RequestStatus.successState(news));
      } else {
        newsStreamSink(RequestStatus.errorState(
            Utils.getMessageIdFromApiException(context, error)));
      }
    });
  }

  clearAndGetNewsOrders(BuildContext context) {
    _lastDate = null;
    isLoading = false;
    _newsList.clear();
    getNews(context);
  }

  Future _cleanTables() {
    return Future.wait([
      appDatabase.newDao.nukeTable(),
      appDatabase.newImageDao.nukeTable(),
      appDatabase.typeDao.nukeTable(),
    ]);
  }

  _saveNewsInDatabase(List<NewsResponse> newsResponseList) async {
    await Future.forEach(newsResponseList, (NewsResponse element) async {
      var newCompanion = NewsCompanion(
        id: Value(element.id),
        title: Value(element.title),
        description: Value(element.description),
        path: Value(element.path),
        notifiable: Value(element.notifiable),
        state: Value(element.state),
        newsTypeId: Value(element.newsTypeId),
        createdBy: Value(element.createdBy),
        createdAt: Value(element.createdAt),
        updatedAt: Value(element.updatedAt),
      );
      try {
        await appDatabase.runInTransaction(() async {
          await appDatabase.newDao.insertEntity(newCompanion);
          List<Insertable<NewImage>> newImageList = [];
          element.images?.forEach((item) {
            Insertable<NewImage> newImageInsertable =
                NewsImagesCompanion.insert(
                    id: Value(item.id),
                    path: Value(item.path),
                    newId: element.id);
            newImageList.add(newImageInsertable);
          });
          await appDatabase.newImageDao.insertAll(newImageList);
        });
      } catch (exception) {
        print(exception);
      }
    });
  }

  _saveTypesInDataBase(List<TypesResponse> typesResponseList) {
    typesResponseList.forEach((element) {
      var typesCompanion = TypesCompanion(
        id: Value(element.id),
        name: Value(element.name),
        createdBy: Value(element.createdBy),
        createdAt: Value(element.createdAt),
        updatedAt: Value(element.updatedAt),
      );
      appDatabase.typeDao.insertEntity(typesCompanion);
    });
  }

  void savePdf(String url) async {
    OpenResult result;
    try {
      final file = await downloadFile(url);
      result = await OpenFile.open(file.path);
      print(result.message);
    } catch (e) {
      print(e);
    }
  }

  Future<File> downloadFile(String url) async {
    var httpClient = HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    var bytes = await consolidateHttpClientResponseBytes(response);
    String dir = (await getApplicationDocumentsDirectory()).path;
    File file = new File('$dir/${url.split('/').last}');
    await file.writeAsBytes(bytes);
    return file;
  }
}
