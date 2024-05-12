import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/core/helpers/assets_path.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/features/cart/ui/widgets/custom_button.dart';
import 'package:shuwaikh/generated/l10n.dart';

import '../../../core/routing/routes.dart';
import 'widgets/info_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                verticalSpace(50),
                SvgPicture.asset(
                  Assets.userAvatar,
                  height: 150,
                ),
                verticalSpace(20),
                Text(
                  'Mohamed',
                  style: TextStyles.font24Black700Weight,
                ),
                verticalSpace(20),
                InfoItem(
                  icon: Icons.phone_outlined,
                  title: S.of(context).phome_number,
                  data: '123456788995',
                ),
                verticalSpace(20),
                InfoItem(
                  icon: Icons.email_outlined,
                  title: S.of(context).email,
                  data: 'Mohamed@gmail.com',
                ),
                verticalSpace(20),
                const InfoItem(
                  icon: Icons.location_on_outlined,
                  title: 'Location',
                ),
                verticalSpace(70),
                CustomButton(
                  text: 'UPDATE PROFILE',
                  color: ColorsManager.blue,
                  onTap: () => context.pushNamed(Routes.updateProfile),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
