import 'package:flutter/material.dart';
import 'package:shuwaikh/core/theming/styles.dart';
import 'package:shuwaikh/generated/l10n.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../../core/theming/colors.dart';

class PaymentWebView extends StatefulWidget {
  final WebViewController webViewController;

  const PaymentWebView({super.key, required this.webViewController});

  @override
  State<PaymentWebView> createState() => _PaymentWebViewState();
}

class _PaymentWebViewState extends State<PaymentWebView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text(
          S.of(context).check_out,
          style: AppTextStyles.font20White700Weight,
        ),
        backgroundColor: AppColors.blue,
      ),
      body: WebViewWidget(controller: widget.webViewController),
    );
  }
}
