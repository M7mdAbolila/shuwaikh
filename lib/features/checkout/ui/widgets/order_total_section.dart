import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'package:shuwaikh/features/vouncher/logic/cubit/check_coupon_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

// ignore: must_be_immutable
class OrderTotalAndDiscountSection extends StatefulWidget {
  OrderTotalAndDiscountSection({super.key, required this.cartTotal});
  double cartTotal;
  @override
  State<OrderTotalAndDiscountSection> createState() =>
      _OrderTotalAndDiscountSectionState();
}

class _OrderTotalAndDiscountSectionState
    extends State<OrderTotalAndDiscountSection> {
  double? subTotal;
  double? couponAmount = 0;
  int? coupon;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    subTotal = widget.cartTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).order_total,
          style: AppTextStyles.font26Blue700Weight,
        ),
        verticalSpace(20),
        OrderTotalWidget(
          title: S.of(context).cart_total,
          price: 'KD${widget.cartTotal.toStringAsFixed(2)}',
        ),
        OrderTotalWidget(
          title: S.of(context).discount,
          price: '-KD${couponAmount!.toStringAsFixed(2)}',
        ),
        OrderTotalWidget(
          title: S.of(context).cart_subtotal,
          price: 'KD${subTotal?.toStringAsFixed(2)}',
        ),
        OrderTotalWidget(
          title: S.of(context).tax,
          price: '+KD00.0',
        ),
        verticalSpace(20),
        Text(
          S.of(context).discount,
          style: AppTextStyles.font26Blue700Weight,
        ),
        verticalSpace(10),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: S.of(context).coupon,
                validator: (v) {},
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                onChanged: (value) {
                  coupon = int.parse(value!);
                },
              ),
            ),
            horizontalSpace(8),
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.blue),
              ),
              onPressed: () {
                context.read<CheckCouponCubit>().checkCoupon(
                      widget.cartTotal,
                      coupon,
                    );
              },
              child: Text(
                S.of(context).apply,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        BlocListener<CheckCouponCubit, CheckCouponState>(
          listener: (context, state) {
            if (state is CheckCouponSuccess) {
              context.pop();
              setState(() {
                couponAmount = state.couponAmount!;
                subTotal = widget.cartTotal - state.couponAmount!;
                context.read<PlaceOrderCubit>().discount = state.couponAmount;
              });
            } else if (state is CheckCouponFailure) {
              context.pop();
              customSnackBar(context, state.errMessage, true);
            } else if (state is CheckCouponLoading) {
              showDialog(
                context: context,
                builder: (context) => const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.blue,
                  ),
                ),
              );
            }
          },
          child: const SizedBox.shrink(),
        ),
      ],
    );
  }
}

class OrderTotalWidget extends StatelessWidget {
  const OrderTotalWidget({
    super.key,
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: AppTextStyles.font16Black500Weight,
            ),
            Text(
              price,
              style: AppTextStyles.font16Black500Weight,
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
