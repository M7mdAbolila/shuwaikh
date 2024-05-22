import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/networking/api_service.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/home/data/repos/get_coupons_repo.dart';
import 'package:shuwaikh/features/home/logic/get_coupons_cubit/get_coupons_cubit.dart';
import 'package:shuwaikh/features/home/ui/widgets/voucher_section.dart';

import '../../../drawer/cubit/username_cubit.dart';

class VoucherScreenBody extends StatelessWidget {
  const VoucherScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(30),
            Container(
              width: 335.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.r),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.6),
                    spreadRadius: -1,
                    blurRadius: 14,
                    offset: const Offset(4, 7),
                  ),
                ],
              ),
              child: Column(
                children: [
                  verticalSpace(15),
                  Image.asset(
                    'assets/images/QRcode.jpg',
                    width: 225.w,
                    height: 225.h,
                  ),
                  verticalSpace(15),
                  Container(
                    width: 335.w,
                    height: 93.h,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(16),
                        bottomRight: Radius.circular(16),
                      ),
                      gradient: LinearGradient(colors: [
                        ColorsManager.darkBlue,
                        ColorsManager.blue,
                        ColorsManager.darkBlue,
                      ]),
                    ),
                    child: Center(
                      child: BlocBuilder<UsernameCubit, UsernameState>(
                        builder: (context, state) {
                          return Text(
                            state.username,
                            // state.username,
                            style: TextStyles.font20White700Weight,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            verticalSpace(35),
            BlocProvider(
              create: (context) =>
                  GetCouponsCubit(GetCouponsRepo(ApiService(Dio())))
                    ..getCoupons(),
              child: const VoucherSection(),
            ),
          ],
        ),
      ),
    );
  }
}
