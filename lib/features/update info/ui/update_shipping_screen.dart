import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/update%20info/logic/update_shipping_cubit/update_shipping_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/widgets/u_shipping_bloc_listener.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/colors.dart';
import '../../../core/widgets/app_text_field.dart';
import '../../../generated/l10n.dart';
import '../../cart/ui/widgets/custom_button.dart';

class UpdateShippingScreen extends StatelessWidget {
  const UpdateShippingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).edit_shipping,
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
                    controller: context.read<UpdateShippingCubit>().fname,
                    validator: (j) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).last_name,
                    controller: context.read<UpdateShippingCubit>().lname,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).address,
                    controller: context.read<UpdateShippingCubit>().address,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).city,
                    controller: context.read<UpdateShippingCubit>().city,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).contact_email,
                    controller: context.read<UpdateShippingCubit>().email,
                    validator: (v) {}),
                verticalSpace(15),
                AppTextFormField(
                    hintText: S.of(context).phome_number,
                    controller: context.read<UpdateShippingCubit>().number,
                    validator: (v) {}),
                verticalSpace(50),
                CustomButton(
                  text: S.of(context).update,
                  color: ColorsManager.blue,
                  onTap: () =>
                      context.read<UpdateShippingCubit>().updateShipping(),
                ),
                const UpdateShippingBlocListener()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
