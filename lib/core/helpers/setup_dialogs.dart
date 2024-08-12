import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';

import '../../generated/l10n.dart';
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
        title: Text(S.of(context).signup_scess),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(S.of(context).congratulate_signup),
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
            child: Text(S.of(context).continue_word),
          ),
        ],
      );
    },
  );
}

void deleteAccountDialog(BuildContext context, VoidCallback onPressed) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(S.of(context).sure_delete_acc),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.grey,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: () {
              context.pop();
            },
            child: Text(S.of(context).cancel),
          ),
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: AppColors.blue,
              disabledForegroundColor: Colors.grey.withOpacity(0.38),
            ),
            onPressed: onPressed,
            child: Text(S.of(context).yes),
          ),
        ],
      );
    },
  );
}
