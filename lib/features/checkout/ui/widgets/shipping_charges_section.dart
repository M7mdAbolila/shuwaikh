import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/checkout/logic/shipping_charge_cubit/shipping_charge_cubit.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';

import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/shipping_charge_response.dart';

class ShippingChargesSection extends StatefulWidget {
  const ShippingChargesSection({
    super.key,
  });

  @override
  State<ShippingChargesSection> createState() => _ShippingChargesSectionState();
}

class _ShippingChargesSectionState extends State<ShippingChargesSection> {
  @override
  void initState() {
    super.initState();
    context.read<ShippingChargeCubit>().shippingCharge();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).shipping_charges,
          style: TextStyles.font16Black700Weight,
        ),
        BlocBuilder<ShippingChargeCubit, ShippingChargeState>(
          builder: (context, state) {
            if (state is ShippingChargeSuccess) {
              return ShippingChargeListview(shipping: state.shipping);
            } else if (state is ShippingChargeFailure) {
              return CustomErrorWidget(errMessage: state.errMessge ?? getFail);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class ShippingChargeListview extends StatefulWidget {
  ShippingChargeListview({
    super.key,
    required this.shipping,
  });
  final List<Shipping>? shipping;
  String? selectedShipping;

  @override
  State<ShippingChargeListview> createState() => _ShippingChargeListviewState();
}

class _ShippingChargeListviewState extends State<ShippingChargeListview> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.shipping!.length,
      itemBuilder: (BuildContext context, int index) {
        String title = widget.shipping![index].title!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 270.w,
              child: RadioListTile(
                title: Text(title),
                subtitle: Text(widget.shipping![index].text!),
                value: title,
                groupValue: widget.selectedShipping,
                activeColor: ColorsManager.blue,
                onChanged: (value) {
                  setState(() {
                    widget.selectedShipping = value;
                    context.read<PlaceOrderCubit>().shippingCharge =
                        widget.shipping![index].id;
                    context.read<PlaceOrderCubit>().selectCharges = true;
                  });
                },
              ),
            ),
            Text('+ KD${widget.shipping![index].charge}'),
          ],
        );
      },
    );
  }
}
