import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/widgets/app_single_scffold.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppScaffold(
        appBarIcon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        appBarTitle: 'Your Favourites',
        appBarOnPressed: () => context.pop(),
        body: const Icon(
          Icons.error,
          size: 40,
        ),
      ),
    );
  }
}
