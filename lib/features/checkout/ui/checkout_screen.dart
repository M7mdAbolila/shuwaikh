// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/setup_dialogs.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/checkout/data/models/checkout_arguments.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';
import 'package:shuwaikh/features/checkout/ui/widgets/order_total_section.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import 'widgets/checkout_button.dart';
import 'widgets/pay_via_widget.dart';
import 'widgets/shipping_and_billing_section.dart';
import 'widgets/shipping_charges_section.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.arguments,
  });
  final CheckoutArguments arguments;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
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
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Form(
            key: context.read<PlaceOrderCubit>().formKey,
            child: Column(
              children: [
                verticalSpace(25),
                ShippingAndBillingDetailsSection(
                  firstTime: widget.arguments.firstTime,
                ),
                const ShippingChargesSection(),
                verticalSpace(20),
                OrderTotalAndDiscountSection(cartTotal: widget.arguments.total),
                verticalSpace(20),
                const PayViaWidget(),
                verticalSpace(20),
                BlocListener<PlaceOrderCubit, PlaceOrderState>(
                  listener: (context, state) {
                    if (state is PlaceOrderSuccess) {
                      context.pop();
                      customSnackBar(context, state.message, false);
                      // context.read<GetCartCubit>().getCart();
                    } else if (state is PlaceOrderFailure) {
                      context.pop();
                      customSnackBar(context, state.errMessage, true);
                    } else if (state is PlaceOrderLoading) {
                      loadingDialog(context);
                    }
                  },
                  child: const SizedBox.shrink(),
                ),
                const CheckoutButton(),
                verticalSpace(100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
