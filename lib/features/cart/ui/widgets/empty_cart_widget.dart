import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../../generated/l10n.dart';
import '../../../nav_bar/cubit/change_page_cubit.dart';
import 'custom_button.dart';

class EmptyCartWidget extends StatelessWidget {
  const EmptyCartWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        verticalSpace(50),
        Container(
          height: 195.h,
          width: 335.w,
          decoration: BoxDecoration(
            color: AppColors.lightBlue,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: CustomErrMessageWidget(
            errMessage: S.of(context).cart_empty,
          ),
        ),
        verticalSpace(50),
        CustomButton(
          text: S.of(context).add_items_to_cart,
          color: AppColors.blue,
          textStyle: AppTextStyles.font20White700Weight,
          onTap: () => context.read<ChangePageCubit>().changePage(2),
        ),
        verticalSpace(100),
      ],
    );
  }
}