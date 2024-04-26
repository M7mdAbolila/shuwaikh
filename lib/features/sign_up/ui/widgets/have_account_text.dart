import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../core/routing/routes.dart';
import '../../../../generated/l10n.dart';

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
            S.of(context).do_you_have_account,
            style: TextStyles.font14Black400Weight,
          ),
          Text(
            '  ${S.of(context).sign_in}',
            style: TextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}
