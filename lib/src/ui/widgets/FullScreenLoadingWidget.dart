import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';

class FullScreenLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitThreeBounce(
          size: 100,
          color: SccsColors.navyBlue,
        ),
      ),
    );
  }
}
