import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class InfoWidget extends StatelessWidget {
  const InfoWidget({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font14Black400Weight,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          subtitle,
          style: AppTextStyles.font14Blue400Weight,
        ),
      ],
    );
  }
}
