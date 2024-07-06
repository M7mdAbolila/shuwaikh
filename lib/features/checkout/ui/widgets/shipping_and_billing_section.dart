import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/checkout/ui/widgets/billing_address_section.dart';
import 'package:shuwaikh/features/checkout/ui/widgets/shipping_address_section.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../generated/l10n.dart';
import '../../logic/place_order_cubit/place_order_cubit.dart';

// ignore: must_be_immutable
class ShippingAndBillingDetailsSection extends StatefulWidget {
  ShippingAndBillingDetailsSection({super.key, required this.firstTime});
  bool firstTime;
  @override
  State<ShippingAndBillingDetailsSection> createState() =>
      _ShippingAndBillingDetailsSectionState();
}

class _ShippingAndBillingDetailsSectionState
    extends State<ShippingAndBillingDetailsSection> {
  bool useSavedDetails = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        widget.firstTime
            ? Column(
                children: [
                  const ShippingAddressSection(),
                  verticalSpace(10),
                  const BillingAddressSection(),
                  verticalSpace(20),
                ],
              )
            : Row(
                children: [
                  Checkbox(
                    activeColor: ColorsManager.blue,
                    value: useSavedDetails,
                    onChanged: (check) {
                      setState(() {
                        useSavedDetails = check!;
                        check
                            ? context.read<PlaceOrderCubit>().useSavedDetails =
                                true
                            : context.read<PlaceOrderCubit>().useSavedDetails =
                                false;
                      });
                    },
                  ),
                  SizedBox(
                    width: 250.w,
                    child: Text(
                      S.of(context).want_use_saved_details,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
        verticalSpace(10),
        useSavedDetails == false
            ? Column(
                children: [
                  const ShippingAddressSection(),
                  verticalSpace(10),
                  const BillingAddressSection(),
                  verticalSpace(20),
                ],
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
