import 'package:flutter/material.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class CheckBoxWidget extends StatefulWidget {
  const CheckBoxWidget({super.key, required this.name, required this.price});
  final String name;
  final num price;

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
                value: isChecked,
                activeColor: ColorsManager.blue,
                onChanged: (check) {
                  setState(() {
                    isChecked = check;
                  });
                }),
            Text(
              widget.name,
              style: TextStyles.font16Gray400Weight,
            ),
          ],
        ),
        Text('+ KD${widget.price}'),
      ],
    );
  }
}
