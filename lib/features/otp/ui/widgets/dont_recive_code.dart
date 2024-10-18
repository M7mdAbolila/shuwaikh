import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class DontReciveCode extends StatelessWidget {
  const DontReciveCode({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${S.of(context).dont_recive} ',
            style: AppTextStyles.font14Black400Weight,
          ),
          Text(
            S.of(context).resend,
            style: AppTextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}
