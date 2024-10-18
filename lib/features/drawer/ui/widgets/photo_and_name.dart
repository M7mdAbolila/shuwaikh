import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/drawer/logic/username_cubit.dart';

import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';

class PhotoAndName extends StatefulWidget {
  const PhotoAndName({
    super.key,
  });

  @override
  State<PhotoAndName> createState() => _PhotoAndNameState();
}

class _PhotoAndNameState extends State<PhotoAndName> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        color: AppColors.darkBlue,
        borderRadius: isArabic()
            ? BorderRadius.only(bottomLeft: Radius.circular(80.r))
            : BorderRadius.only(bottomRight: Radius.circular(80.r)),
      ),
      child: BlocBuilder<UsernameAndPhotoCubit, UsernameAndPhotoState>(
        builder: (context, state) {
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              horizontalSpace(20),
              state.photo.isNullOrEmpty()
                  ? SvgPicture.asset(
                      Assets.userAvatar,
                      height: 70.h,
                    )
                  : CachedNetworkImage(
                      imageUrl: state.photo!.contains('https://')
                          ? state.photo!
                          : '${ImagesPaths.userPhotoPath}${state.photo}',
                      placeholder: (context, url) => SvgPicture.asset(
                        Assets.userAvatar,
                        height: 70.h,
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        color: Colors.red,
                        size: 70,
                      ),
                      imageBuilder: (context, imageProvider) {
                        return Container(
                          height: 70.h,
                          width: 70.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 2.w,
                              color: Colors.white,
                            ),
                            image: DecorationImage(
                              image: imageProvider,
                              fit: BoxFit.fill,
                            ),
                          ),
                        );
                      },
                    ),
              horizontalSpace(15),
              SizedBox(
                width: 130.w,
                child: Text(
                  state.username.isNullOrEmpty() ? unknown : state.username!,
                  style: AppTextStyles.font26White500Weight,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
