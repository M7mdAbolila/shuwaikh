import 'package:flutter/material.dart';
import 'package:shuwaikh/features/nav%20bar/nav_bar_screen.dart';
import '../../drawer/drawer_screen.dart';
import 'widgets/home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      bottomNavigationBar: CustomNavBar(
        index: 0,
      ),
      body: const HomeScreenBody(),
    );
  }
}
