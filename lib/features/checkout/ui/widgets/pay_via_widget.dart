import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/checkout/logic/place_order_cubit/place_order_cubit.dart';

import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class PayViaWidget extends StatefulWidget {
  const PayViaWidget({
    super.key,
  });

  @override
  State<PayViaWidget> createState() => _PayViaWidgetState();
}

class _PayViaWidgetState extends State<PayViaWidget> {
  String? group = 'offline';
  @override
  void initState() {
    super.initState();
    context.read<PlaceOrderCubit>().gateway = 'offline';
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).pay_via,
          style: AppTextStyles.font16Black700Weight,
        ),
        RadioListTile(
          activeColor: AppColors.blue,
          title: Text(
            S.of(context).cash_on_delivery,
          ),
          value: 'offline',
          groupValue: group,
          onChanged: (v) {
            setState(() {
              group = v;
              context.read<PlaceOrderCubit>().gateway = v;
            });
          },
        ),
        RadioListTile(
          activeColor: AppColors.blue,
          title: const Text(
            'Knet',
          ),
          value: 'Knet',
          groupValue: group,
          onChanged: (v) {
            setState(() {
              group = v;
              context.read<PlaceOrderCubit>().gateway = v;
            });
          },
        ),
      ],
    );
  }
}
