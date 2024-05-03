import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
import 'package:shuwaikh/features/Products_page/ui/widgets/products_categories_section.dart';
import 'package:shuwaikh/features/Products_page/ui/widgets/products_section.dart';
import 'package:shuwaikh/generated/l10n.dart';

class ProductsScreenBody extends StatefulWidget {
  const ProductsScreenBody({super.key});

  @override
  State<ProductsScreenBody> createState() => _ProductsScreenBodyState();
}

class _ProductsScreenBodyState extends State<ProductsScreenBody> {


  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      isSubWidget: true,
      mainText1: S.of(context).its_great_day_for,
      mainText2: S.of(context).coffee,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            verticalSpace(20),
            const ProductsCategoriesSection(),
            verticalSpace(20),
            const ProuductsSection(),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}
