import 'package:flutter/material.dart';

class CardInformation extends StatelessWidget {
  final String text;

  CardInformation({required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.0),
        subtitle: Text(
          text,
          style: TextStyle(fontSize: 15.0, color: Colors.white),
        ),
        leading: Icon(
          Icons.info_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}