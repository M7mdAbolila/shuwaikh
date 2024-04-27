import 'package:flutter/material.dart';
import 'package:shuwaikh/features/drawer/drawer_screen.dart';
import 'widgets/voucher_body.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({super.key});

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> with AutomaticKeepAliveClientMixin {
 
 @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const Scaffold(
      drawer: CustomDrawer(),
      body: VoucherScreenBody(),
    );
  }
}
