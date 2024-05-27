import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/helpers/custom_snack_bar.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/account/logic/cubit/profile_cubit.dart';
import 'package:shuwaikh/features/update%20info/logic/update_profile_cubit/update_profile_cubit.dart';

import '../../../../core/theming/colors.dart';

class UpdateProfileBlocListener extends StatelessWidget {
  const UpdateProfileBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) async {
        if (state is UpdateProfileSuccess) {
          context.pop();
          customSnackBar(context, state.message, false);
          context.read<ProfileCubit>().getProfileData();
        } else if (state is UpdateProfileFailure) {
          context.pop();
          customSnackBar(context, state.errMessage, true);
        } else if (state is UpdateProfileLoading) {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.blue,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
