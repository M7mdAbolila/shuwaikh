import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class CountItemWidget extends StatelessWidget {
  const CountItemWidget({
    super.key,
    required this.count,
  });
  final int count;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Text(
        '$count ${S.of(context).items}',
        style: AppTextStyles.font18MainBlue500Weight,
        // style: TextStyles.font18MainBlue500Weight.copyWith(
        //   decoration: TextDecoration.underline,
        //   decorationColor: ColorsManager.mainBlue,
        // ),
      ),
    );
  }
}
