import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../core/routing/routes.dart';

class DontHaveAccont extends StatelessWidget {
  const DontHaveAccont({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pushNamed(Routes.signUpScreen);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Don’t have an account ? ',
            style: TextStyles.font14Black400Weight,
          ),
          Text(
            ' Register',
            style: TextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}
