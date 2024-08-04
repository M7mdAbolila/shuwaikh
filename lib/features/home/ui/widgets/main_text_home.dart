import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';

class MainTextHome extends StatelessWidget {
  const MainTextHome({
    super.key,
    required this.mainText1,
    required this.mainText2,
  });
  final String mainText1;
  final String mainText2;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        verticalSpace(20),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$mainText1 \n',
                style: AppTextStyles.font26White500Weight,
              ),
              TextSpan(
                text: mainText2,
                style: AppTextStyles.font36White700Weight,
              ),
            ],
          ),
        ),
        verticalSpace(20),
      ],
    );
  }
}
