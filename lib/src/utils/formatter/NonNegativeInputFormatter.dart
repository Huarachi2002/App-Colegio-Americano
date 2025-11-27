import 'package:colegio_americano/src/utils/Utils.dart';
import 'package:flutter/services.dart';

class NonNegativeInputFormatter extends TextInputFormatter {

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    String newText = newValue.text;

    if(newText.isEmpty) return newValue;
    if(newText.contains('-') || newText.contains(' ')) return oldValue;

    return oldValue;
  }

}