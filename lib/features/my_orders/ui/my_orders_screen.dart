import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/my_orders/logic/cubit/my_orders_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/theming/styles.dart';

class MyOrdersScreen extends StatelessWidget {
  const MyOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          S.of(context).my_orders,
          style: AppTextStyles.font20White700Weight,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: BlocBuilder<MyOrdersCubit, MyOrdersState>(
          builder: (context, state) {
            if (state is MyOrdersSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.orders!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 310.w,
                    margin: EdgeInsets.only(bottom: 15.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          color: AppColors.lightBlue,
                          spreadRadius: 0,
                          blurRadius: 8,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OrderInfo(
                            title: S.of(context).order_number,
                            subtitle: state.orders![index].orderNumber!,
                          ),
                          OrderInfo(
                            title: S.of(context).shipping_method,
                            subtitle: state.orders![index].shippingMethod!,
                          ),
                          OrderInfo(
                            title: S.of(context).order_status,
                            subtitle: state.orders![index].orderStatus!,
                          ),
                          OrderInfo(
                            title: S.of(context).payment_status,
                            subtitle: state.orders![index].paymentStatus!,
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: '${S.of(context).order_total}:  ',
                                  style: AppTextStyles.font16Black700Weight,
                                ),
                                TextSpan(
                                  text: 'KD${state.orders![index].total!}',
                                  style: AppTextStyles.font18Blue500Weight,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is MyOrdersFailure) {
              return CustomErrMessageWidget(
                  errMessage: state.errMessage ?? getFail);
            } else {
              return const CustomLoadingWidget();
            }
          },
        ),
      ),
    );
  }
}

class OrderInfo extends StatelessWidget {
  const OrderInfo({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: '$title:  ',
            style: AppTextStyles.font16Black700Weight,
          ),
          TextSpan(
            text: subtitle,
            style: AppTextStyles.font14Blue400Weight,
          ),
        ],
      ),
    );
  }
}
