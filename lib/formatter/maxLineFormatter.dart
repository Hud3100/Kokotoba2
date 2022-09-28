import 'package:flutter/services.dart';

class MaxLinesTextInputFormatter extends TextInputFormatter {
  final int maxLinesForced;

  MaxLinesTextInputFormatter(this.maxLinesForced);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue,TextEditingValue newValue) {
    final newLineCount = '\n'.allMatches(newValue.text).length + 1;

    if(newLineCount > maxLinesForced) {
      return oldValue;
    }

    return newValue;
  }
}