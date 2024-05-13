import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/account/logic/cubit/profile_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';

import 'widgets/info_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  return Column(
                    children: [
                      verticalSpace(50),
                      SvgPicture.asset(
                        Assets.userAvatar,
                        height: 150,
                      ),
                      verticalSpace(20),
                      Text(
                        state.userData!.username ?? getFail,
                        style: TextStyles.font24Black700Weight,
                      ),
                      verticalSpace(20),
                      InfoItem(
                        icon: Icons.phone_outlined,
                        title: S.of(context).phome_number,
                        data: state.userData!.number,
                      ),
                      verticalSpace(20),
                      InfoItem(
                        icon: Icons.email_outlined,
                        title: S.of(context).email,
                        data: state.userData!.email,
                      ),
                      verticalSpace(20),
                      InfoItem(
                        icon: Icons.location_on_outlined,
                        title: 'Address',
                        data: state.userData!.address,
                      ),
                      verticalSpace(70),
                      ProfileButton(
                        title: 'UPDATE PROFILE',
                        onPressed: () =>
                            context.pushNamed(Routes.updateProfile),
                      ),
                    ],
                  );
                } else if (state is ProfileFailure) {
                  return CustomErrorWidget(
                      errMessage: state.errmessage ?? 'Get Profile Failure');
                } else {
                  return const CustomLoadingWidget();
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
    required this.title,
    this.onPressed,
  });
  final String title;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(ColorsManager.blue),
      ),
      onPressed: onPressed,
      child: Center(
        child: Text(
          title,
          style: TextStyles.font20White700Weight,
        ),
      ),
    );
  }
}
