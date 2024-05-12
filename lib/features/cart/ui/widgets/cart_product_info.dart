import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../product_details/data/models/addons_model.dart';
import '../../../product_details/data/models/variation_model.dart';
import '../../data/models/get_cart/get_cart_response.dart';

class CartProductInfo extends StatefulWidget {
  const CartProductInfo({
    super.key,
    required this.cartItem,
  });
  final CartItem? cartItem;

  @override
  State<CartProductInfo> createState() => _CartProductInfoState();
}

class _CartProductInfoState extends State<CartProductInfo> {
  @override
  Widget build(BuildContext context) {
    Size? size;
    if (widget.cartItem!.variations != null) {
      size = jsonToVariation();
    }
    Addons? addons;
    if (widget.cartItem!.addons != null) {
      addons = jsonToAddons();
    }
    return Padding(
      padding: isArabic()
          ? EdgeInsets.only(right: 15.w)
          : EdgeInsets.only(left: 15.w),
      child: SizedBox(
        width: 160.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cartItem!.title ?? '',
              style: TextStyles.font24Black500Weight,
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).total}: ',
                    style: TextStyles.font16Black400Weight,
                  ),
                  TextSpan(
                    text: 'KD${widget.cartItem!.total}',
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).quantity}:  ',
                    style: TextStyles.font16Black400Weight,
                  ),
                  TextSpan(
                    text: widget.cartItem!.qty.toString(),
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).size}:  ',
                    style: TextStyles.font16Black400Weight,
                  ),
                  TextSpan(
                    text: size?.name,
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '${S.of(context).price}:  ',
                    style: TextStyles.font16Black400Weight,
                  ),
                  TextSpan(
                    text: '${size?.price ?? widget.cartItem!.productPrice}',
                    style: TextStyles.font18Blue500Weight,
                  ),
                ],
              ),
            ),
            widget.cartItem!.addons == null
                ? const SizedBox.shrink()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        S.of(context).addons,
                        style: TextStyles.font16Black500Weight,
                      ),
                      ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: addons!.addons.length,
                        itemBuilder: (context, index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${addons?.addons[index].name ?? ''} ',
                                style: TextStyles.font14Black400Weight,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                'KD${addons?.addons[index].price}',
                                style: TextStyles.font14Blue400Weight,
                              ),
                            ],
                          );
                        },
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${S.of(context).addons}:  ',
                              style: TextStyles.font16Black400Weight,
                            ),
                            TextSpan(
                              text: 'KD${widget.cartItem?.addonsPrice}',
                              style: TextStyles.font18Blue500Weight,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Size jsonToVariation() {
    String? jsonString = widget.cartItem!.variations;
    final jsonData = jsonDecode(jsonString!);
    final variation = Size.fromJson(jsonData);
    return variation;
  }

  Addons jsonToAddons() {
    String? jsonString = widget.cartItem!.addons;
    final jsonData = jsonDecode(jsonString!);
    final addons = Addons.fromJson(jsonData);
    return addons;
  }
}
