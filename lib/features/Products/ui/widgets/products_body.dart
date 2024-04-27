import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/core/widgets/app_scroll_scaffold.dart';
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
            verticalSpace(35),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 8,
              itemBuilder: (context, index) {
                return const HorizontalBroductItem();
              },
            ),
            verticalSpace(100),
          ],
        ),
      ),
    );
  }
}

class HorizontalBroductItem extends StatelessWidget {
  const HorizontalBroductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        width: 335.w,
        height: 100.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: ColorsManager.lightBlue,
              offset: Offset(5, 5),
              blurRadius: 14,
              spreadRadius: -4,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.broduct),
                ),
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: isArabic()
                  ? EdgeInsets.only(right: 15.w)
                  : EdgeInsets.only(left: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latte',
                    style: TextStyles.font24Black500Weight,
                  ),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: '${S.of(context).price} ',
                          style: TextStyles.font16Black400Weight,
                        ),
                        TextSpan(
                          text: 'KD 100',
                          style: TextStyles.font18Blue500Weight,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(20),
                  Row(
                    children: [
                      const Icon(
                        Icons.favorite,
                        color: Colors.red,
                        size: 18,
                      ),
                      horizontalSpace(2),
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 18,
                      ),
                      Text(
                        '4.5',
                        style: TextStyles.font11Black500Weight,
                      )
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(60),
            const CircleAvatar(
              radius: 20,
              backgroundColor: ColorsManager.mainBlue,
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
