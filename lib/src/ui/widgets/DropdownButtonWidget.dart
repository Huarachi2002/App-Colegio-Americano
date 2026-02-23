import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:colegio_americano/src/theme/SccsColors.dart';

class DropdownButtonWidget extends StatelessWidget {
  String dropdownValue = 'One';
  Function setState;

  DropdownButtonWidget(this.dropdownValue, this.setState);

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      hint: Text('Tipo de licencia'),
      icon: const Icon(Icons.arrow_drop_down),
      iconSize: 24,
      underline: Container(
        height: 2,
        color: SccsColors.navyBlue,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
