// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/user_info_cachce.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/ui/widgets/custom_button.dart';
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
                    context, S.of(context).select_shipping_charge, true);
              }
            }
          },
        ),
      ],
    );
  }
}
