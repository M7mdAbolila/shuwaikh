import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/update%20info/logic/update_billing_cubit/update_billing_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/widgets/u_billing_bloc_listener.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../generated/l10n.dart';
import '../../cart/ui/widgets/custom_button.dart';

class UpdateBillingScreen extends StatelessWidget {
  const UpdateBillingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).edit_billing,
          style: TextStyles.font20White700Weight,
        ),
        backgroundColor: ColorsManager.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                verticalSpace(25),
                AppTextFormField(
                    hintText: S.of(context).first_name,
                    controller: context.read<UpdateBillingCubit>().fname,
                    validator: (j) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).last_name,
                    controller: context.read<UpdateBillingCubit>().lname,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).address,
                    controller: context.read<UpdateBillingCubit>().address,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).city,
                    controller: context.read<UpdateBillingCubit>().city,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).contact_email,
                    controller: context.read<UpdateBillingCubit>().email,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).phome_number,
                    controller: context.read<UpdateBillingCubit>().number,
                    validator: (v) {}),
                verticalSpace(50),
                CustomButton(
                  text: S.of(context).update,
                  color: ColorsManager.blue,
                  onTap: () =>
                      context.read<UpdateBillingCubit>().updateBilling(),
                ),
                const UpdateBillingBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
