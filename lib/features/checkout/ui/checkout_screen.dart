import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/cart/ui/widgets/custom_button.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'package:shuwaikh/features/checkout/ui/widgets/billing_address_section.dart';
import 'package:shuwaikh/features/checkout/ui/widgets/order_total_section.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import 'widgets/pay_via_widget.dart';
import 'widgets/shipping_address_section.dart';
import 'widgets/shipping_charges_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key, required this.cartTotal});
  final double? cartTotal;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  bool sameAddress = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).check_out,
          style: TextStyles.font20White700Weight,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: context.read<PlaceOrderCubit>().formKey,
            child: Column(
              children: [
                verticalSpace(25),
                const ShippingAddressSection(),
                verticalSpace(10),
                Row(
                  children: [
                    Checkbox(
                      activeColor: ColorsManager.blue,
                      value: sameAddress,
                      onChanged: (check) {
                        setState(() {
                          sameAddress = check!;
                          check
                              ? context.read<PlaceOrderCubit>().sameAsShipping =
                                  1
                              : context.read<PlaceOrderCubit>().sameAsShipping =
                                  0;
                        });
                      },
                    ),
                    SizedBox(
                      width: 250.w,
                      child: Text(
                        S.of(context).same_address,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                verticalSpace(10),
                sameAddress
                    ? const SizedBox.shrink()
                    : const BillingAddressSection(),
                verticalSpace(20),
                const ShippingChargesSection(),
                verticalSpace(20),
                OrderTotalAndDiscountSection(
                  cartTotal: widget.cartTotal!,
                ),
                verticalSpace(20),
                const PayViaWidget(),
                verticalSpace(20),
                BlocListener<PlaceOrderCubit, PlaceOrderState>(
                  listener: (context, state) {
                    if (state is PlaceOrderSuccess) {
                      context.pop();
                      customSnackBar(context, state.message, false);
                      setState(() {});
                    } else if (state is PlaceOrderFailure) {
                      context.pop();
                      customSnackBar(context, state.errMessage, true);
                    } else if (state is PlaceOrderLoading) {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(
                            color: ColorsManager.blue,
                          ),
                        ),
                      );
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
                CustomButton(
                  text: S.of(context).order,
                  color: ColorsManager.blue,
                  onTap: () {
                    if (context
                        .read<PlaceOrderCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      if (context.read<PlaceOrderCubit>().selectCharges) {
                        context.read<PlaceOrderCubit>().placeOrder();
                      } else {
                        customSnackBar(context, 'select shipping charge', true);
                      }
                    }
                  },
                ),
                verticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
