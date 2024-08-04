import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';

import '../routing/routes.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

void errorDialog(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppTextStyles.font16Blue400Weight,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppTextStyles.font14Black400Weight,
          ),
        ),
      ],
    ),
  );
}

Future<dynamic> loadingDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => const Center(
      child: CircularProgressIndicator(
        color: AppColors.blue,
      ),
    ),
  );
}

void signupSuccessDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Signup Successful'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Congratulations, you have signed up successfully!'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              context.pushNamed(Routes.loginScreen);
            },
            child: const Text('Continue'),
          ),
        ],
      );
    },
  );
}
