import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';

class ComboWidget extends StatelessWidget {
  const ComboWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 2.w, right: 13.w, bottom: 4.h),
      width: 250,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 123.w,
            decoration: const BoxDecoration(
              color: ColorsManager.lightBlue,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          horizontalSpace(10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Combo 1',
                style: TextStyles.font18MainBlue500Weight,
              ),
              const ComboItem(),
              const ComboItem(),
              const ComboItem(),
              const ComboItem(),
            ],
          )
        ],
      ),
    );
  }
}

class ComboItem extends StatelessWidget {
  const ComboItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const BlackCircle(),
          horizontalSpace(5),
          Text(
            'item1',
            style: TextStyles.font14Black400Weight,
          ),
        ],
      ),
    );
  }
}

class BlackCircle extends StatelessWidget {
  const BlackCircle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: 5,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.black),
    );
  }
}
