import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/account/logic/cubit/profile_cubit.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/routing/routes.dart';
import 'widgets/info_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsManager.blue,
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).account,
          style: TextStyles.font20White700Weight,
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileSuccess) {
                  return Column(
                    children: [
                      verticalSpace(50),
                      state.userData!.photo == null
                          ? SvgPicture.asset(
                              Assets.userAvatar,
                              height: 150,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  '$userPhotoPath${state.userData!.photo}',
                              placeholder: (context, url) =>
                                  const CustomLoadingWidget(),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                              imageBuilder: (context, imageProvider) {
                                return Container(
                                  height: 150,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 2.w,
                                      color: ColorsManager.blue,
                                    ),
                                    image: DecorationImage(
                                      image: imageProvider,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                );
                              },
                            ),
                      verticalSpace(20),
                      Text(
                        state.userData!.username ?? getFail,
                        style: TextStyles.font24Black700Weight,
                      ),
                      verticalSpace(20),
                      const Divider(),
                      verticalSpace(10),
                      InfoItem(
                        icon: Icons.phone_outlined,
                        title: S.of(context).phome_number,
                        data: state.userData!.number,
                      ),
                      verticalSpace(10),
                      const Divider(),
                      verticalSpace(10),
                      InfoItem(
                        icon: Icons.email_outlined,
                        title: S.of(context).email,
                        data: state.userData!.email,
                      ),
                      verticalSpace(10),
                      const Divider(),
                      verticalSpace(10),
                      InfoItem(
                        icon: Icons.location_on_outlined,
                        title: S.of(context).address,
                        data: state.userData!.address,
                      ),
                      verticalSpace(50),
                      ProfileButton(
                        title: S.of(context).update_profile,
                        onPressed: () => context.pushNamed(
                          Routes.updateProfile,
                          arguments: state.userData!.photo,
                        ),
                      ),
                    ],
                  );
                } else if (state is ProfileFailure) {
                  return CustomErrorWidget(
                    errMessage: state.errmessage ?? getFail,
                  );
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
