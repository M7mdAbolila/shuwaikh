import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
  });

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).quantity,
          style: TextStyles.font20Black500Weight,
        ),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (quantity > 1) {
                  setState(() {
                    quantity -= 1;
                  });
                }
              },
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: ColorsManager.lightBlue,
                child: Icon(
                  Icons.remove,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
            horizontalSpace(15),
            Text(
              quantity.toString(),
              style: TextStyles.font20Black500Weight,
            ),
            horizontalSpace(15),
            GestureDetector(
              onTap: () => setState(() {
                quantity += 1;
              }),
              child: const CircleAvatar(
                radius: 12,
                backgroundColor: ColorsManager.mainBlue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
