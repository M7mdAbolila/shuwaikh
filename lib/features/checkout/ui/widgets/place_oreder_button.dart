// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/theming/styles.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/helpers/user_info_cachce.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../../../cart/ui/widgets/custom_button.dart';
import '../../logic/place_order_cubit/place_order_cubit.dart';

class PlaceOrderButton extends StatefulWidget {
  const PlaceOrderButton({
    super.key,
  });

  @override
  State<PlaceOrderButton> createState() => _PlaceOrderButtonState();
}

class _PlaceOrderButtonState extends State<PlaceOrderButton> {
  bool saveDetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        saveDetails == true
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).want_save_for_future,
                    style: AppTextStyles.font16Black500Weight,
                  ),
                  verticalSpace(10),
                  Text(
                    S.of(context).can_edit_from_setting,
                    style: const TextStyle(color: AppColors.blue),
                  ),
                  verticalSpace(15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: AppColors.lightBlue,
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
                          backgroundColor: AppColors.blue,
                          disabledForegroundColor:
                              Colors.grey.withOpacity(0.38),
                        ),
                        onPressed: () async {
                          await saveShippingAndBillingDetails(context);
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
          color: AppColors.blue,
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
