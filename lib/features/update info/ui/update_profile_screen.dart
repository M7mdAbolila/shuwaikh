import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/widgets/u_profile_bloc_listener.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/theming/styles.dart';
import '../../cart/ui/widgets/custom_button.dart';
import 'widgets/update_photo_widget.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key, this.photo});
  final String? photo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).edit_profile,
          style: TextStyles.font20White700Weight,
        ),
        backgroundColor: ColorsManager.blue,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                UpdatePhotoWidget(photo: photo),
                verticalSpace(40),
                AppTextFormField(
                  hintText: S.of(context).address,
                  validator: (v) {},
                  controller: context.read<UpdateProfileCubit>().address,
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: S.of(context).old_pass,
                  controller: context.read<UpdateProfileCubit>().oldPassowrd,
                  validator: (v) {},
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: S.of(context).new_pass,
                  validator: (v) {},
                  controller: context.read<UpdateProfileCubit>().newPassowrd,
                ),
                verticalSpace(50),
                CustomButton(
                  text: S.of(context).update,
                  color: ColorsManager.blue,
                  onTap: () =>
                      context.read<UpdateProfileCubit>().updateProfile(),
                ),
                const UpdateProfileBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
