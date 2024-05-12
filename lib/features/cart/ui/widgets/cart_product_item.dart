import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/cart/data/models/get_cart/get_cart_response.dart';
import 'package:shuwaikh/features/cart/logic/remove_from_cart/remove_from_cart_cubit.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/colors.dart';
import 'cart_product_info.dart';

class CartBroductItem extends StatelessWidget {
  const CartBroductItem({
    super.key,
    required this.cartItem,
  });
  final CartItem? cartItem;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => context.pushNamed(Routes.productDetailsScreen),
      child: Container(
        margin: EdgeInsets.only(bottom: 15.h),
        padding: EdgeInsets.symmetric(vertical: 10.h),
        width: 335.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: ColorsManager.lightBlue,
              offset: Offset(5, 5),
              blurRadius: 14,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: CachedNetworkImageProvider(
                    '$productPath${cartItem!.image}',
                  ),
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            CartProductInfo(
              cartItem: cartItem,
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                context
                    .read<RemoveFromCartCubit>()
                    .removeFromCart(cartItem!.productId);
                log('  = == = =${cartItem!.productId} = = = =');
              },
              icon: const Icon(
                Icons.delete_outline,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
