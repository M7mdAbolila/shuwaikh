import 'package:flutter/material.dart';
import 'package:shuwaikh/features/product_details/data/models/variation_model.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SelectSizeWidget extends StatefulWidget {
  const SelectSizeWidget({super.key, required this.variation});
  final Variation variation;
  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  bool? isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).select_size,
          style: TextStyles.font24Black500Weight,
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: widget.variation.sizes.length,
          itemBuilder: (context, index) {
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
                      widget.variation.sizes[index].name,
                      style: TextStyles.font16Gray400Weight,
                    ),
                  ],
                ),
                Text('+ KD${widget.variation.sizes[index].price}'),
              ],
            );
          },
        ),
      ],
    );
  }
}
