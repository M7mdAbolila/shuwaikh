import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/is_arabic.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/routing/routes.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/widgets/app_scroll_scaffold.dart';
import '../../../../generated/l10n.dart';
import 'cart_product_item.dart';
import 'custom_button.dart';

class CartScreenBody extends StatelessWidget {
  const CartScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScrollScaffold(
      appBarTitle: S.of(context).my_cart,
      appBarIcon:  Icon( isArabic() ? Icons.arrow_forward : Icons.arrow_back, color: Colors.white),
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
