import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/features/drawer/cubit/username_cubit.dart';

import '../../core/helpers/is_arabic.dart';
import '../../core/theming/colors.dart';
import '../../core/theming/styles.dart';

class PhotoAndName extends StatefulWidget {
  const PhotoAndName({
    super.key,
  });

  @override
  State<PhotoAndName> createState() => _PhotoAndNameState();
}

class _PhotoAndNameState extends State<PhotoAndName> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<UsernameCubit>();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 203.h,
      decoration: BoxDecoration(
        color: ColorsManager.darkBlue,
        borderRadius: isArabic()
            ? const BorderRadius.only(bottomLeft: Radius.circular(80))
            : const BorderRadius.only(bottomRight: Radius.circular(80)),
      ),
      child: Center(
        child: BlocBuilder<UsernameCubit, UsernameState>(
          builder: (context, state) {
            return Text(
              state.username,
              style: TextStyles.font26White500Weight,
            );
          },
        ),
      ),
    );
  }
}
