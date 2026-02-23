import 'package:flutter/material.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';

class CardInformation extends StatelessWidget {
  final String text;

  CardInformation({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: SccsColors.navyBlue,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        subtitle: Text(
          text,
          style: TextStyle(fontSize: 15.0, color: SccsColors.white),
        ),
        leading: Icon(
          Icons.info_outline_rounded,
          color: SccsColors.white,
        ),
      ),
    );
  }
}
