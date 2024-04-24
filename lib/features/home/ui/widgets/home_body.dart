import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/app_background.dart';

import '../../../../core/helpers/spacing.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      isHome: true,
      appBarIcon: SvgPicture.asset(Assets.menuIcon),
      isSubWidget: true,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            SizedBox(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        Assets.banner,
                        width: 320,
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 215.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Container(
                      height: 210.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              Image.asset(
                                Assets.broduct,
                                height: 130,
                                fit: BoxFit.fill,
                              ),
                              const Align(
                                alignment: Alignment.topRight,
                                child: Padding(
                                  padding: EdgeInsets.all(5),
                                  child: CircleAvatar(
                                    radius: 15,
                                    backgroundColor: ColorsManager.blue,
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 4.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Ice coffee',
                                  style: TextStyles.font13Black500Weight,
                                ),
                                verticalSpace(15),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'price: ',
                                        style: TextStyles.font10Gray500Weight,
                                      ),
                                      TextSpan(
                                        text: '\$100',
                                        style: TextStyles.font14Black400Weight,
                                      ),
                                    ],
                                  ),
                                  //! product item  
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            verticalSpace(30),
            Container(
              color: Colors.red,
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Text(
                    '$index',
                    style: TextStyles.font30Black400Weight,
                    textAlign: TextAlign.center,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
