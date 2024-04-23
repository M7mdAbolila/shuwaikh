import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class DontReciveCode extends StatelessWidget {
  const DontReciveCode({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Dont receive SMS ? ',
            style: TextStyles.font14Black400Weight,
          ),
          Text(
            ' Resend',
            style: TextStyles.font14Blue400Weight,
          )
        ],
      ),
    );
  }
}