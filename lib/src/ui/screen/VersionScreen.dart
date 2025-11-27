
import 'package:colegio_americano/src/ui/view_model/VersionScreenViewModel.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:url_launcher/url_launcher.dart';

class VersionScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _VersionScreenState();
}

class _VersionScreenState extends State<VersionScreen> {
  VersionScreenViewModel _viewModel = VersionScreenViewModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nueva versión'),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 2.0, right: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Existe una nueva versión de la app, por favor actualice la app para seguir usandola.',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Divider(
              color: Colors.transparent,
            ),
            ElevatedButton.icon(
              onPressed: () {
                _launchURL();
              },
              icon: Icon(
                Platform.isAndroid
                    ? Icons.android_rounded
                    : Icons.phone_iphone_rounded,
                color: Colors.white,
              ),
              label: Text(
                'Ir a la tienda',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  side: BorderSide(color: Colors.redAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _launchURL() async {
    const urlAndroid =
        'https://play.google.com/store/apps/details?id=com.icorebiz.casantacruz';
    const urlIOS =
        'https://apps.apple.com/us/app/ds-santa-cruz-v2-0/id1547202517';
    var url = Platform.isAndroid ? urlAndroid : urlIOS;
    if (await canLaunch(url)) {
      await launch(url);
    }
  }
}
