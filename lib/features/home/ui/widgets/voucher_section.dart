import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/ui/widgets/vouncher_item.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_error_widget.dart';

class VoucherSection extends StatefulWidget {
  const VoucherSection({
    super.key,
  });

  @override
  State<VoucherSection> createState() => _VoucherSectionState();
}

class _VoucherSectionState extends State<VoucherSection> {
  @override
  void initState() {
    super.initState();
    context.read<GetCouponsCubit>().getCoupons();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_voucher,
          style: TextStyles.font24MainBlue500Weight.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: ColorsManager.mainBlue,
          ),
        ),
        verticalSpace(18),
        BlocBuilder<GetCouponsCubit, GetCouponsState>(
          builder: (context, state) {
            if (state is GetCouponsSuccess) {
              return ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: state.coupons!.length,
                itemBuilder: (BuildContext context, int index) {
                  return VoucherItem(
                    coupon: state.coupons![index],
                  );
                },
              );
            } else if (state is GetCouponsFailure) {
              return CustomErrorWidget(
                errMessage: state.errMessage,
              );
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ],
    );
  }
}
