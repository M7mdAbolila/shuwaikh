import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/l10n.dart';
import '../../logic/place_order_cubit/place_order_cubit.dart';

class BillingAddressSection extends StatefulWidget {
  const BillingAddressSection({
    super.key,
  });

  @override
  State<BillingAddressSection> createState() => _BillingAddressSectionState();
}

class _BillingAddressSectionState extends State<BillingAddressSection> {
  bool sameAddress = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Checkbox(
              activeColor: ColorsManager.blue,
              value: sameAddress,
              onChanged: (check) {
                setState(() {
                  sameAddress = check!;
                  check
                      ? context.read<PlaceOrderCubit>().sameAsShipping = 1
                      : context.read<PlaceOrderCubit>().sameAsShipping = 0;
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
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).billing_address,
                    style: TextStyles.font26Blue700Weight,
                  ),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).first_name,
                      controller: context.read<PlaceOrderCubit>().billingFname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_info;
                        }
                      }),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).last_name,
                      controller: context.read<PlaceOrderCubit>().billingLname,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_info;
                        }
                      }),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).address,
                      controller:
                          context.read<PlaceOrderCubit>().billingAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_info;
                        }
                      }),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).city,
                      controller: context.read<PlaceOrderCubit>().billingCity,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_info;
                        }
                      }),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).contact_email,
                      controller: context.read<PlaceOrderCubit>().billingEmail,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_email;
                        }
                      }),
                  verticalSpace(15),
                  AppTextFormField(
                      hintText: S.of(context).phome_number,
                      controller: context.read<PlaceOrderCubit>().billingNumber,
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return S.of(context).enter_valid_phone;
                        }
                      }),
                ],
              ),
      ],
    );
  }
}
