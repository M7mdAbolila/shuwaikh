import 'package:flutter/material.dart';
import 'package:shuwaikh/core/theming/colors.dart';

void customSnackBar(context, String? text, bool isError) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: isError ? Colors.red : ColorsManager.blue,
      content: Text(text ?? ''),
    ),
  );
}
