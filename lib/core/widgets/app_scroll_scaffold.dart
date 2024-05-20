import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shuwaikh/features/home/ui/widgets/main_text_home.dart';
import '../helpers/assets_path.dart';
import '../helpers/is_arabic.dart';
import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppScrollScaffold extends StatelessWidget {
  const AppScrollScaffold({
    super.key,
    required this.body,
    this.appBarTitle,
    this.isSubWidget = false,
    this.mainText1,
    this.mainText2,
    this.appBarOnPressed,
    this.appBarIcon,
  });
  final Widget body;
  final String? appBarTitle;
  final VoidCallback? appBarOnPressed;
  final Widget? appBarIcon;
  final String? mainText1;
  final String? mainText2;
  final bool isSubWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorsManager.blue,
      child: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              verticalSpace(15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// ===== App Bar =======
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: appBarOnPressed ??
                              () {
                                Scaffold.of(context).openDrawer();
                              },
                          child: Transform.flip(
                            flipX: isArabic() ? true : false,
                            child: appBarIcon ??
                                SvgPicture.asset(
                                  Assets.menuIcon,
                                ),
                          ),
                        ),
                        Text(
                          appBarTitle ?? '',
                          style: TextStyles.font30White400Weight,
                        ),
                        const SizedBox.shrink(),
                        // InkWell(
                        //   onTap: () {},
                        //   child: const CircleAvatar(
                        //     backgroundColor: ColorsManager.darkBlue,
                        //     child: Icon(
                        //       Icons.notifications_none,
                        //       color: Colors.white,
                        //     ),
                        //   ),
                        // )
                      ],
                    ),

                    /// ====== main text in home ======
                    isSubWidget
                        ? MainTextHome(
                            mainText1: mainText1 ?? '',
                            mainText2: mainText2 ?? '')
                        : Column(
                            children: [
                              const SizedBox.shrink(),
                              verticalSpace(45),
                            ],
                          ),
                  ],
                ),
              ),

              /// ======= body =========
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: body,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
