import 'package:flutter/material.dart';

import 'widgets/otp_body.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: OtpScreenBody(),
    );
  }
}
