import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shuwaikh/features/product_details/data/models/variation_model.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/cubit/calc_total_cubit.dart';

// ignore: must_be_immutable
class SelectSizeWidget extends StatefulWidget {
  SelectSizeWidget({super.key, required this.variation});
  final Variation variation;
  String? selectedSize;
  @override
  State<SelectSizeWidget> createState() => _SelectSizeWidgetState();
}

class _SelectSizeWidgetState extends State<SelectSizeWidget> {
  String defaultSizeFromJson() {
    String jsonString = jsonEncode(widget.variation.sizes[0]);
    return jsonString;
  }

  String sizeFromJson(Size size) {
    String jsonString = jsonEncode(size);
    return jsonString;
  }

  @override
  void initState() {
    super.initState();
    widget.selectedSize = widget.variation.sizes[0].name;
    // context.read<AddToCartCubit>().defaultVariations = defaultSizeFromJson();
    context.read<AddToCartCubit>().variations = defaultSizeFromJson();
    context.read<AddToCartCubit>().variationsPrice =
        widget.variation.sizes[0].price as double?;
    context.read<CalcTotalCubit>().varPrice = widget.variation.sizes[0].price;
    context.read<CalcTotalCubit>().calcTotal();
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
            String? sizeName = widget.variation.sizes[index].name;
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 180.w,
                  child: RadioListTile(
                    title: Text(sizeName),
                    value: sizeName,
                    groupValue: widget.selectedSize,
                    activeColor: ColorsManager.blue,
                    onChanged: (value) {
                      setState(() {
                        widget.selectedSize = value as String;
                        context.read<AddToCartCubit>().variations =
                            sizeFromJson(widget.variation.sizes[index]);
                        context.read<AddToCartCubit>().variationsPrice =
                            widget.variation.sizes[index].price as double?;

                        context.read<CalcTotalCubit>().varPrice =
                            widget.variation.sizes[index].price;
                        context.read<CalcTotalCubit>().calcTotal();
                      });
                    },
                  ),
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
