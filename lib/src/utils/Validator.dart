import 'package:flutter/cupertino.dart';
import 'package:colegio_americano/src/localization/AppLocalizations.dart';
import 'package:validators/validators.dart';

String? isNotEmpty(dynamic value) {
  if (value == null) return 'empty_value_message';
  if (value is String && value.isEmpty) return 'empty_value_message';
  if ((value is int || value is double) && value.isNaN)
    return 'empty_value_message';
}

String? isNumeric(dynamic value) {
  if (isNotEmpty(value) != null) return null;
  if (value is String && !isInt(value)) return 'non_numeric_value_message';
  if (value is int && !isInt(value.toString()))
    return 'non_numeric_value_message';
  if (value is double && !isInt(value.toString()))
    return 'non_numeric_value_message';
}

String? isNotZero(dynamic value) {
  if (isNotEmpty(value) != null) return null;
  if (value is String && !isInt(value)) return 'non_numeric_value_message';
  if (value is int && !isInt(value.toString()))
    return 'non_numeric_value_message';
  if (value is double && !isInt(value.toString()))
    return 'non_numeric_value_message';
  if (value is String && double.parse(value) == 0)
    return 'is_zero_value_message';
}

String? isDouble(dynamic value) {
  if (isNotEmpty(value) != null) return null;
  if (value is String && !isFloat(value)) return 'non_numeric_value_message';
  if (value is int && !isFloat(value.toString()))
    return 'non_numeric_value_message';
  if (value is double && !isFloat(value.toString()))
    return 'non_numeric_value_message';
}

String? validate(BuildContext context, List<Function> validations) {
  for (final validation in validations) {
    String? message = validation();
    if (message != null) return AppLocalizations.of(context).translate(message);
  }
}
