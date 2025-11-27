import 'dart:async';
import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:colegio_americano/src/data/local/preference/LoginPreference.dart';
import 'package:colegio_americano/src/data/remote/LicenseApiService.dart';
import 'package:colegio_americano/src/data/remote/exception/ApiException.dart';
import 'package:colegio_americano/src/data/remote/request/AuthRequest.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

typedef Future<T> FutureGenerator<T>();

class Utils {
  static bool isDialogActive = false;
  static bool isAppOpen = false;

  static String getMessageIdFromApiException(BuildContext context, exception) {
    if (exception is Error)
      return AppLocalizations.of(context)
          .translate(UnknownApiException().messageId);
    if (exception is ApiException) return exception.messageId;
    if (exception is IOException || exception is SocketException)
      return AppLocalizations.of(context).translate(IoApiException().messageId);
    return AppLocalizations.of(context)
        .translate(UnknownApiException().messageId);
  }

  /// Timeout de seguridad a nivel de aplicación.
  /// El timeout HTTP (connectionTimeout: 15s) debería actuar primero.
  /// Este timeout es una red de seguridad para casos donde el HTTP timeout no actúe.
  static const int _requestTimeoutSeconds = 20;

  static Future<T> retryFuture<T>(
      int retries, Future<T> Function() aFuture) async {
    try {
      print("Attempting future, $retries left.");
      return await aFuture.call().timeout(
        Duration(seconds: _requestTimeoutSeconds),
        onTimeout: () {
          print("Request timed out after $_requestTimeoutSeconds seconds!");
          throw TimeoutException('La solicitud tomó demasiado tiempo');
        },
      );
    } catch (e) {
      print("Catch: Error in retryFuture: $e");
      if (e is ApiException) rethrow;
      if (retries > 1) {
        await Future.delayed(Duration(seconds: 1));
        return retryFuture(retries - 1, aFuture);
      }
      rethrow;
    }
  }

  static Future issueToken() async {
    try {
      print("[AUTH INTERCEPTOR Login] Issuing new token");
      GetIt getIt = GetIt.instance;
      LicenseApiService apiService = getIt<LicenseApiService>();
      LoginPreference loginPreference = getIt<LoginPreference>();
      final body = AuthRequestBuilder()
        ..codeParent = await loginPreference.fatherErpCode
        ..username = 'licencias'
        ..password = '4d6asd15';
      print(body.build());
      final response = await apiService.issueToken(body.build());
      print("[AUTH INTERCEPTOR Login] error: ${response.error}");
      print("[AUTH INTERCEPTOR Login] body: ${response.bodyString}");
      if (response.isSuccessful) {
        final body = response.body!;
        print(
            "[AUTH INTERCEPTOR Login] Setting access token: ${body.authorization}");
        loginPreference.setLicenseAuthTokenKey(body.authorization!);
        return true;
      }
      return false;
    } catch (e) {
      print("[AUTH INTERCEPTOR Login] exception: $e");
      return false;
    }
  }

  static showConfirmAlert(
      BuildContext context,
      String title,
      String description,
      String acceptMessage,
      String denyMessage,
      Function acceptCallback) {
    Utils.isDialogActive = true;
    List<DialogButton> list = [];
    if (acceptMessage.isNotEmpty) {
      list.add(
        DialogButton(
          color: Colors.red,
          child: Text(
            acceptMessage,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Utils.isDialogActive = false;
            acceptCallback();
          },
          width: 120,
        ),
      );
    }
    list.add(
      DialogButton(
        color: Colors.red,
        child: Text(
          denyMessage,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        onPressed: () {
          Utils.isDialogActive = false;
          Navigator.of(context, rootNavigator: true).pop();
        },
        width: 120,
      ),
    );
    Alert(
            context: context,
            type: AlertType.warning,
            style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
            title: title,
            desc: description,
            buttons: list)
        .show();
  }

  static Future<String> getUniqueId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      // return iosDeviceInfo.identifierForVendor;
      return iosDeviceInfo.identifierForVendor!;
    } else {
      AndroidDeviceInfo androidDeviceInfo = await deviceInfo.androidInfo;
      return androidDeviceInfo.id;
    }
  }

  static bool isInteger(String? s) {
    if (s == null) return false;
    return int.tryParse(s) != null;
  }

  static showExitAlert(context) {
    Utils.isDialogActive = true;
    Alert(
      context: context,
      type: AlertType.warning,
      style: AlertStyle(isCloseButton: false, isOverlayTapDismiss: false),
      title: AppLocalizations.of(context).translate('exit_alert_title'),
      desc: AppLocalizations.of(context).translate('exit_alert_message'),
      buttons: [
        DialogButton(
          child: Text(
            AppLocalizations.of(context).translate('alert_accept_label'),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Utils.isDialogActive = false;
            exit(0);
          },
          width: 120,
        ),
        DialogButton(
          child: Text(
            AppLocalizations.of(context).translate('alert_cancel_label'),
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () {
            Utils.isDialogActive = false;
            Navigator.of(context, rootNavigator: true).pop();
          },
          width: 120,
        ),
      ],
    ).show();
  }
}
