import 'package:flutter/material.dart';
import '../../drawer/drawer_screen.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: CustomDrawer(),
      body: HomeScreenBody(),
    );
  }
}
