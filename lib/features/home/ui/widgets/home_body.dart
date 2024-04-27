import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/home/ui/widgets/broduct_item.dart';
import 'package:shuwaikh/features/home/ui/widgets/combo_widget.dart';
import 'package:shuwaikh/features/home/ui/widgets/deal_item.dart';
import 'package:shuwaikh/generated/l10n.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/helpers/spacing.dart';
import 'banner_list_view.dart';
import 'category_section.dart';
import 'voucher_section.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      appBarIcon: Transform.flip(
        flipX: isArabic() ? true : false,
        child: SvgPicture.asset(
          Assets.menuIcon,
        ),
      ),
      isSubWidget: true,
      mainText1: S.of(context).welcome_to,
      mainText2: 'SHUWAIKH',
      appBarOnPressed: () {
        Scaffold.of(context).openDrawer();
      },
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            const BannerListView(),
            verticalSpace(20),
            const CategorySection(
              catogoryName: 'New',
              item: BroductItem(),
              itemCount: 8,
            ),
            verticalSpace(15),
            const CategorySection(
              catogoryName: 'Hot deals',
              item: DealItem(),
              itemCount: 6,
            ),
            verticalSpace(30),
            const CategorySection(
              catogoryName: 'Combo',
              height: 120,
              item: ComboWidget(),
              itemCount: 5,
            ),
            verticalSpace(40),
            const VoucherSection(),
            verticalSpace(20),
          ],
        ),
      ),
    );
  }
}
