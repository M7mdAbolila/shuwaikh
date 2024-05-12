import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/app_text_field.dart';
import 'package:shuwaikh/features/update%20info/logic/cubit/update_profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/ui/widgets/u_profile_bloc_listener.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../cart/ui/widgets/custom_button.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(50),
                Center(
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorsManager.blue,
                      ),
                    ),
                  ),
                ),
                verticalSpace(40),
                AppTextFormField(
                  hintText: S.of(context).address,
                  validator: (v) {},
                  controller: context.read<UpdateProfileCubit>().address,
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: S.of(context).password,
                  validator: (v) {},
                  controller: context.read<UpdateProfileCubit>().newPassowrd,
                ),
                verticalSpace(20),
                AppTextFormField(
                  hintText: S.of(context).password,
                  validator: (v) {},
                  controller: context.read<UpdateProfileCubit>().oldPassowrd,
                ),
                verticalSpace(50),
                CustomButton(
                  text: 'UPDATE ',
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
