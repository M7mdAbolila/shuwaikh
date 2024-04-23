import 'package:flutter/material.dart';

import '../helpers/spacing.dart';
import '../theming/colors.dart';
import '../theming/styles.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({
    super.key,
    required this.body,
    this.appBarTitle,
    this.appBarIcon,
    this.appBarOnPressed,
    this.isHome = false,
    this.isSubWidget = false,
  });
  final Widget body;
  final String? appBarTitle;
  final Widget? appBarIcon;
  final bool isHome;
  final bool isSubWidget;
  final VoidCallback? appBarOnPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: ColorsManager.mainBlue,
      child: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                verticalSpace(50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: appBarOnPressed,
                            child: appBarIcon ?? const SizedBox(),
                          ),
                          Text(
                            appBarTitle ?? '',
                            style: TextStyles.font30White400Weight,
                          ),
                          horizontalSpace(1),
                          isHome
                              ? InkWell(
                                  onTap: () {},
                                  child: const CircleAvatar(
                                    backgroundColor: ColorsManager.darkBlue,
                                    child: Icon(
                                      Icons.notifications_none,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                      isSubWidget
                          ? Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                verticalSpace(20),
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Welcome to \n',
                                        style: TextStyles.font26White500Weight,
                                      ),
                                      TextSpan(
                                        text: 'KOFEHOLIC',
                                        style: TextStyles.font36White700Weight,
                                      ),
                                    ],
                                  ),
                                ),
                                verticalSpace(20),
                              ],
                            )
                          : Column(
                              children: [
                                const SizedBox.shrink(),
                                verticalSpace(45),
                              ],
                            ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
