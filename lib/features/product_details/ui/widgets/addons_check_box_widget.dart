import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shuwaikh/features/product_details/data/models/addons_model.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/cubit/calc_total_cubit.dart';

class AddonsCheckBoxWidget extends StatefulWidget {
  const AddonsCheckBoxWidget({
    super.key,
    this.isAddons = false,
    required this.addon,
  });
  final Addon? addon;
  final bool isAddons;

  @override
  State<AddonsCheckBoxWidget> createState() => _AddonsCheckBoxWidgetState();
}

class _AddonsCheckBoxWidgetState extends State<AddonsCheckBoxWidget> {
  bool? isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 12.w),
              child: Checkbox(
                  value: isChecked,
                  activeColor: ColorsManager.blue,
                  onChanged: (check) {
                    setState(() {
                      isChecked = check;
                      if (check == true) {
                        context.read<AddToCartCubit>().addAddons(addonToJson());
                        context
                            .read<AddToCartCubit>()
                            .addAddonsPrice(widget.addon!.price);

                        context
                            .read<CalcTotalCubit>()
                            .addAddonPrice(widget.addon!.price);
                        context.read<CalcTotalCubit>().calcTotal();
                      } else {
                        context
                            .read<AddToCartCubit>()
                            .removeAddon(addonToJson());
                        context
                            .read<AddToCartCubit>()
                            .removeAddonsPrice(widget.addon!.price);
                        context
                            .read<CalcTotalCubit>()
                            .removeAddonPrice(widget.addon!.price);
                        context.read<CalcTotalCubit>().calcTotal();
                      }
                    });
                  }),
            ),
            Text(
              widget.addon!.name,
              style: TextStyles.font16Gray400Weight,
            ),
          ],
        ),
        Text('+ KD${widget.addon!.price}'),
      ],
    );
  }

  String addonToJson() {
    String jsonString = jsonEncode(widget.addon!.toJson());
    return jsonString;
  }
}
