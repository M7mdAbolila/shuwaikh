import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/constants.dart';

class ShuwaikhApp extends StatelessWidget {
  const ShuwaikhApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData(
        fontFamily: kFontFamily,
      ),
    );
  }
}
