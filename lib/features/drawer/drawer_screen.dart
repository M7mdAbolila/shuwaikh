import 'package:flutter/material.dart';

import '../../core/helpers/spacing.dart';
import 'drawer_menu.dart';
import 'photo_and_name.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const PhotoAndName(),
            verticalSpace(15),
            const Divider(),
            verticalSpace(20),
            const DrawerMenu(),
          ],
        ),
      ),
    );
  }
}
