import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shuwaikh/features/product_details/data/models/variation_model.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/variation_check_box_widget.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class SelectSizeWidget extends StatefulWidget {
  const SelectSizeWidget({super.key, required this.variation});
  final Variation variation;
  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  String sizeToJson() {
    String jsonString = jsonEncode(widget.variation.sizes[0].toJson());
    return jsonString;
  }

  @override
  void initState() {
    super.initState();
    context.read<AddToCartCubit>().defaultVariations = sizeToJson();
  }

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
            return VariationCheckBoxWidget(
              size: widget.variation.sizes[index],
            );
          },
        ),
      ],
    );
  }
}
