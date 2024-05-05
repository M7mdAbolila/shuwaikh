import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/drawer/cubit/username_cubit.dart';
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
      backgroundColor: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocProvider(
              create: (context) => UsernameCubit(),
              child: const PhotoAndName(),
            ),
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
