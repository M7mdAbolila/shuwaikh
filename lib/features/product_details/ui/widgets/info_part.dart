import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/cart/logic/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:shuwaikh/features/product_details/data/models/addons_model.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/addons.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/quantity_widget.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/select_size_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/product_details_response.dart';
import '../../data/models/variation_model.dart';
import 'add_to_cart_bloc_listener.dart';
import 'product_info_and_is_favourite.dart';

class InfoPart extends StatefulWidget {
  const InfoPart({
    super.key,
    required this.productDetails,
  });
  final ProductDetails? productDetails;

  @override
  State<InfoPart> createState() => _InfoPartState();
}

class _InfoPartState extends State<InfoPart> {
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<AddToCartCubit>().title = widget.productDetails!.title;
      context.read<AddToCartCubit>().productId = widget.productDetails!.id;
      context.read<AddToCartCubit>().productPrice =
          double.tryParse(widget.productDetails!.currentPrice!);
    });
  }

  @override
  Widget build(BuildContext context) {
    Variation? variation;
    if (widget.productDetails!.variations != null) {
      variation = jsonStringToVariation();
    }
    Addons? addons;
    if (widget.productDetails!.addons != null) {
      addons = jsonStringToAddons();
    }

    return SliverFillRemaining(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(35),
                ProductInfoAndIsFavourite(
                  productDetails: widget.productDetails,
                ),
                verticalSpace(15),
                widget.productDetails!.variations == null ||
                        variation!.sizes.isEmpty
                    ? const SizedBox.shrink()
                    : SelectSizeWidget(
                        variation: variation,
                      ),
                widget.productDetails!.addons == null || addons!.addons.isEmpty
                    ? const SizedBox.shrink()
                    : SelectAddons(
                        addons: addons,
                      ),
                verticalSpace(10),
                const QuantityWidget(),
                const AddToCartBlocListener(),
                verticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Variation jsonStringToVariation() {
    String jsonString = widget.productDetails!.variations ?? '';
    final jsonData = jsonDecode(jsonString);
    final variation = Variation.fromJson(jsonData);
    return variation;
  }

  Addons jsonStringToAddons() {
    String? jsonString = widget.productDetails!.addons;
    final jsonData = jsonDecode(jsonString!);
    final addons = Addons.fromJson(jsonData);
    return addons;
  }
}
