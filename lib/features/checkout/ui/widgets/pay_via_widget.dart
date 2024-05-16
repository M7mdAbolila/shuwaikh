import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class PayViaWidget extends StatelessWidget {
  const PayViaWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).pay_via,
          style: TextStyles.font16Black700Weight,
        ),
        RadioListTile(
          activeColor: Colors.grey,
          title: Text(
            S.of(context).cash_on_delivery,
          ),
          value: '',
          groupValue: '',
          onChanged: (v) {},
        ),
      ],
    );
  }
}
