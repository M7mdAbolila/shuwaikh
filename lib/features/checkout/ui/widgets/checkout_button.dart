// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/user_info_cachce.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/ui/widgets/custom_button.dart';
import '../../../login/data/models/login_response.dart';
import '../../logic/place_order_cubit/place_order_cubit.dart';

class CheckoutButton extends StatefulWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  State<CheckoutButton> createState() => _CheckoutButtonState();
}

class _CheckoutButtonState extends State<CheckoutButton> {
  bool saveDetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        saveDetails == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).want_save_for_future),
                  verticalSpace(10),
                  Text(
                    S.of(context).can_edit_from_setting,
                    style: const TextStyle(color: ColorsManager.blue),
                  ),
                  verticalSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: ColorsManager.lightBlue,
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                        ),
                        onPressed: () {
                          context.read<PlaceOrderCubit>().placeOrder();
                        },
                        child: Text(S.of(context).no),
                      ),
                      horizontalSpace(10),
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: ColorsManager.blue,
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                        ),
                        onPressed: () {
                          saveShippingAndBillingDetails(context);
                        },
                        child: Text(S.of(context).yes),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                ],
              )
            : const SizedBox.shrink(),
        CustomButton(
          text: S.of(context).order,
          color: ColorsManager.blue,
          onTap: () async {
            if (context
                .read<PlaceOrderCubit>()
                .formKey
                .currentState!
                .validate()) {
              if (context.read<PlaceOrderCubit>().selectCharges) {
                if (context.read<PlaceOrderCubit>().useSavedDetails == false) {
                  setState(() {
                    saveDetails = true;
                  });
                } else {
                  await getSavedDataToPalaceOrderCubit(context);
                  context.read<PlaceOrderCubit>().placeOrder();
                }
              } else {
                customSnackBar(
                  context,
                  S.of(context).select_shipping_charge,
                  true,
                );
              }
            }
          },
        ),
      ],
    );
  }

  saveShippingAndBillingDetails(BuildContext context) async {
    if (context.read<PlaceOrderCubit>().sameAsShipping == 1) {
      await UserInfoCachceHelper.cacheUserShippingInfo(
        shAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
        shCity: context.read<PlaceOrderCubit>().shippingCity.text,
        shEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
        shFname: context.read<PlaceOrderCubit>().shippingFname.text,
        shLname: context.read<PlaceOrderCubit>().shippingLname.text,
        shNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
      );
      await UserInfoCachceHelper.cacheUserBillingInfo(
        billAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
        billCity: context.read<PlaceOrderCubit>().shippingCity.text,
        billEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
        billFname: context.read<PlaceOrderCubit>().shippingFname.text,
        billLname: context.read<PlaceOrderCubit>().shippingLname.text,
        billNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
      );
      context.read<PlaceOrderCubit>().placeOrder();
    } else {
      await UserInfoCachceHelper.cacheUserShippingInfo(
        shAddress: context.read<PlaceOrderCubit>().shippingAddress.text,
        shCity: context.read<PlaceOrderCubit>().shippingCity.text,
        shEmail: context.read<PlaceOrderCubit>().shippingEmail.text,
        shFname: context.read<PlaceOrderCubit>().shippingFname.text,
        shLname: context.read<PlaceOrderCubit>().shippingLname.text,
        shNumber: context.read<PlaceOrderCubit>().shippingNumber.text,
      );
      await UserInfoCachceHelper.cacheUserBillingInfo(
        billAddress: context.read<PlaceOrderCubit>().billingAddress.text,
        billCity: context.read<PlaceOrderCubit>().billingCity.text,
        billEmail: context.read<PlaceOrderCubit>().billingEmail.text,
        billFname: context.read<PlaceOrderCubit>().billingFname.text,
        billLname: context.read<PlaceOrderCubit>().billingLname.text,
        billNumber: context.read<PlaceOrderCubit>().billingNumber.text,
      );
      context.read<PlaceOrderCubit>().placeOrder();
    }
  }

  getSavedDataToPalaceOrderCubit(BuildContext context) async {
    final UserData userShippingData =
        await UserInfoCachceHelper.getCachedUserShippingInfo();
    final UserData userBillingData =
        await UserInfoCachceHelper.getCachedUserBillingInfo();
    // = = = = = billing details = = = =
    context.read<PlaceOrderCubit>().billingAddress.text =
        userBillingData.billingAddress!;
    context.read<PlaceOrderCubit>().billingCity.text =
        userBillingData.billingCity!;
    context.read<PlaceOrderCubit>().billingEmail.text =
        userBillingData.billingEmail!;
    context.read<PlaceOrderCubit>().billingFname.text =
        userBillingData.billingFname!;
    context.read<PlaceOrderCubit>().billingLname.text =
        userBillingData.billingLname!;
    context.read<PlaceOrderCubit>().billingNumber.text =
        userBillingData.billingNumber!;
    // = = = =  shipping details = = = = = =
    context.read<PlaceOrderCubit>().shippingAddress.text =
        userShippingData.shippingAddress!;
    context.read<PlaceOrderCubit>().shippingCity.text =
        userShippingData.shippingCity!;
    context.read<PlaceOrderCubit>().shippingEmail.text =
        userShippingData.shippingEmail!;
    context.read<PlaceOrderCubit>().shippingFname.text =
        userShippingData.shippingFname!;
    context.read<PlaceOrderCubit>().shippingLname.text =
        userShippingData.shippingLname!;
    context.read<PlaceOrderCubit>().shippingNumber.text =
        userShippingData.shippingNumber!;
  }
}
