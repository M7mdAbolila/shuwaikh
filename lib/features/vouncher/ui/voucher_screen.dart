import 'package:flutter/material.dart';
import 'package:shuwaikh/features/drawer/drawer_screen.dart';
import 'package:shuwaikh/features/nav%20bar/nav_bar_screen.dart';

import 'widgets/voucher_body.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavBar(
        index: 1,
      ),
      drawer: const CustomDrawer(),
      body: const VoucherScreenBody(),
    );
  }
}
