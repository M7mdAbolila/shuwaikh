import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/ui/widgets/voucher_widgets/vouncher_item.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../../core/helpers/spacing.dart';
import '../../../../../core/theming/styles.dart';
import '../../../../../core/widgets/custom_error_widget.dart';
import 'no_coupon_found.dart';
import 'voucher_shimmer_loading.dart';

class VoucherSection extends StatelessWidget {
  const VoucherSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(context).your_voucher,
          style: AppTextStyles.font24MainBlue500Weight,
        ),
        verticalSpace(18),
        BlocBuilder<GetCouponsCubit, GetCouponsState>(
          builder: (context, state) {
            if (state is GetCouponsSuccess) {
              return state.coupons!.isEmpty
                  ? const NoCouponsFound()
                  : ListView.builder(
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
              return CustomErrMessageWidget(
                errMessage: state.errMessage,
              );
            } else {
              return const VoucherShimmerLoading();
            }
          },
        ),
      ],
    );
  }
}
