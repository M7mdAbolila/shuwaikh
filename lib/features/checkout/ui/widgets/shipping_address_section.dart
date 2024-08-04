import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';

import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../../generated/l10n.dart';

class ShippingAddressSection extends StatelessWidget {
  const ShippingAddressSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).shipping_address,
          style: AppTextStyles.font26Blue700Weight,
        ),
        verticalSpace(15),
        AppTextFormField(
          hintText: S.of(context).first_name,
          controller: context.read<PlaceOrderCubit>().shippingFname,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return S.of(context).enter_valid_info;
            }
          },
        ),
        verticalSpace(15),
        AppTextFormField(
            hintText: S.of(context).last_name,
            controller: context.read<PlaceOrderCubit>().shippingLname,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_info;
              }
            }),
        verticalSpace(15),
        AppTextFormField(
            hintText: S.of(context).address,
            controller: context.read<PlaceOrderCubit>().shippingAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_info;
              }
            }),
        verticalSpace(15),
        AppTextFormField(
            hintText: S.of(context).city,
            controller: context.read<PlaceOrderCubit>().shippingCity,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_info;
              }
            }),
        verticalSpace(15),
        AppTextFormField(
            hintText: S.of(context).contact_email,
            controller: context.read<PlaceOrderCubit>().shippingEmail,
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_email;
              }
            }),
        verticalSpace(15),
        AppTextFormField(
            hintText: S.of(context).phome_number,
            controller: context.read<PlaceOrderCubit>().shippingNumber,
            keyboardType: TextInputType.phone,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return S.of(context).enter_valid_phone;
              }
            }),
      ],
    );
  }
}
