import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class CartTotalWidget extends StatelessWidget {
  const CartTotalWidget({
    super.key,
    required this.total,
  });

  final double? total;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${S.of(context).total}:',
          style: AppTextStyles.font22Grey700Weight,
        ),
        Text(
          'KD ${total!.toStringAsFixed(2)}',
          style: AppTextStyles.font24Black700Weight,
        ),
      ],
    );
  }
}
