import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../generated/l10n.dart';

class HaveAnAccountText extends StatelessWidget {
  const HaveAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.pop();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            S.of(context).do_you_have_account,
            style: AppTextStyles.font14Black400Weight,
          ),
          Text(
            '  ${S.of(context).sign_in}',
            style: AppTextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}
