import 'package:colegio_americano/src/App.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void main() {
  runApp(App());
  EasyLoading.instance..userInteractions = false;
}
