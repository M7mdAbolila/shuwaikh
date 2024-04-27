import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import '../../../../core/helpers/assets_path.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_scroll_scaffold.dart';
import '../../../../generated/l10n.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      appBarTitle: S.of(context).my_cart,
      appBarIcon: const Icon(Icons.arrow_back, color: Colors.white),
      appBarOnPressed: () => context.pushReplacementNamed(Routes.mainScreen),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            verticalSpace(30),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                '3 ${S.of(context).items}',
                style: TextStyles.font18MainBlue500Weight.copyWith(
                  decoration: TextDecoration.underline,
                  decorationColor: ColorsManager.mainBlue,
                ),
              ),
            ),
            verticalSpace(20),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (BuildContext context, int index) {
                return const CartBroductItem();
              },
            ),
            verticalSpace(25),
            CustomButton(
              text: S.of(context).add_more_items,
              color: ColorsManager.lightBlue,
              textStyle: TextStyles.font20MainBlue700Weight,
            ),
            verticalSpace(30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${S.of(context).total}:',
                  style: TextStyles.font22Grey700Weight,
                ),
                Text(
                  'KD 90.00',
                  style: TextStyles.font24Black700Weight,
                ),
              ],
            ),
            verticalSpace(30),
            CustomButton(text: S.of(context).check_out),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    this.color,
    this.textStyle,
  });
  final String text;
  final Color? color;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 335.w,
      height: 50.h,
      decoration: BoxDecoration(
        color: color ?? ColorsManager.mainBlue,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          text,
          style: textStyle ?? TextStyles.font20White700Weight,
        ),
      ),
    );
  }
}

class CartBroductItem extends StatelessWidget {
  const CartBroductItem({
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
                  verticalSpace(12),
                  Row(
                    children: [
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorsManager.mainBlue,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      horizontalSpace(15),
                      Text(
                        '2',
                        style: TextStyles.font20Black500Weight,
                      ),
                      horizontalSpace(15),
                      const CircleAvatar(
                        radius: 12,
                        backgroundColor: ColorsManager.mainBlue,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            horizontalSpace(60),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete_outline,
                )),
          ],
        ),
      ),
    );
  }
}
