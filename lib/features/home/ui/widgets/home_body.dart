import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import '../../../../core/helpers/spacing.dart';
import 'banner_list_view.dart';
import 'category_section.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});
  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      appBarIcon: SvgPicture.asset(Assets.menuIcon),
      isSubWidget: true,
      mainText1: 'Welcome to',
      mainText2: 'SHUWAIKH',
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            const BannerListView(),
            verticalSpace(30),
            const CategorySection(catogoryName: 'New'),
            verticalSpace(15),
            const CategorySection(catogoryName: 'New'),
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
