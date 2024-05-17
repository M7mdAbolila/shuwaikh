import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/cart/data/models/get_cart/get_cart_response.dart';
import 'package:shuwaikh/features/cart/logic/remove_from_cart/remove_from_cart_cubit.dart';
import 'package:shuwaikh/features/cart/ui/widgets/addons_section.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../../core/helpers/constants.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import 'cart_product_info.dart';

class CartBroductItem extends StatelessWidget {
  const CartBroductItem({
    super.key,
    required this.cartItem,
  });
  final CartItem? cartItem;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        children: [
          Row(
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
              horizontalSpace(10),
              IconButton(
                onPressed: () {
                  context
                      .read<RemoveFromCartCubit>()
                      .removeFromCart(cartItem!.productId);
                },
                icon: const Icon(
                  Icons.delete_outline,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Column(
              children: [
                AddonsSection(cartItem: cartItem),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${S.of(context).total}: ',
                      style: TextStyles.font16Black700Weight,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'KD${cartItem!.total!}',
                      style: TextStyles.font18Blue500Weight,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
