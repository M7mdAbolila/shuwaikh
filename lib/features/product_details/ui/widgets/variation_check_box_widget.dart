import 'package:shuwaikh/features/product_details/data/models/variation_model.dart';

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class VariationCheckBoxWidget extends StatefulWidget {
  const VariationCheckBoxWidget({
    super.key,
    required this.size,
  });
  final Size? size;

  @override
  State<VariationCheckBoxWidget> createState() =>
      _VariationCheckBoxWidgetState();
}

class _VariationCheckBoxWidgetState extends State<VariationCheckBoxWidget> {
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
                    context.read<AddToCartCubit>().variations = sizeToJson();
                    context.read<AddToCartCubit>().variationsPrice =
                        widget.size!.price as double?;
                  });
                }),
            Text(
              widget.size!.name,
              style: TextStyles.font16Gray400Weight,
            ),
          ],
        ),
        Text('+ KD${widget.size!.price}'),
      ],
    );
  }

  String sizeToJson() {
    String jsonString = jsonEncode(widget.size!.toJson());
    return jsonString;
  }
}
