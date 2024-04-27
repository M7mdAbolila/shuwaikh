import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/is_arabic.dart';

class BannerListView extends StatelessWidget {
  const BannerListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: isArabic()
                ? const EdgeInsets.only(left: 20)
                : const EdgeInsets.only(right: 20),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                Assets.banner,
                width: 335.w,
              ),
            ),
          );
        },
      ),
    );
  }
}
