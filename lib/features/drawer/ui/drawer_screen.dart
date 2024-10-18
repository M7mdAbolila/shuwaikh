import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/di/dependency_injection.dart';
import 'package:shuwaikh/features/logout/logic/cubit/logout_cubit.dart';
import '../../../core/helpers/spacing.dart';
import 'widgets/drawer_menu.dart';
import 'widgets/photo_and_name.dart';

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
            const PhotoAndName(),
            verticalSpace(15),
            const Divider(),
            verticalSpace(20),
            BlocProvider(
              create: (context) => getIt<LogoutCubit>(),
              child: const DrawerMenu(),
            ),
          ],
        ),
      ),
    );
  }
}
