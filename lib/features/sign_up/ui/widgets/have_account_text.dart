import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../core/routing/routes.dart';

class HaveAnAccountText extends StatelessWidget {
  const HaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do you have an account ? ',
            style: TextStyles.font14Black400Weight,
          ),
          Text(
            ' Sign in',
            style: TextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}
