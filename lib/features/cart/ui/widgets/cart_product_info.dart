import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../product_details/data/models/variation_model.dart';
import '../../data/models/get_cart/get_cart_response.dart';
import 'info_widget.dart';

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

    return Padding(
      padding: isArabic()
          ? EdgeInsets.only(right: 15.w)
          : EdgeInsets.only(left: 15.w),
      child: SizedBox(
        width: 150.w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.cartItem!.title ?? unknown,
              style: AppTextStyles.font18Black700Weight,
            ),
            Padding(
              padding: isArabic()
                  ? EdgeInsets.only(left: 20.w)
                  : EdgeInsets.only(right: 20.w),
              child: Column(
                children: [
                  InfoWidget(
                    title: '${S.of(context).quantity}:',
                    subtitle: widget.cartItem!.qty.toString(),
                  ),
                  InfoWidget(
                    title: '${S.of(context).size}:',
                    subtitle: size!.name,
                  ),
                  InfoWidget(
                    title: '${S.of(context).size_price}: ',
                    subtitle: '${size.price}',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Size jsonToVariation() {
    String? jsonString = widget.cartItem!.variations;
    final jsonData = jsonDecode(jsonString!);
    final variation = Size.fromJson(jsonData['size']);
    return variation;
  }
}
