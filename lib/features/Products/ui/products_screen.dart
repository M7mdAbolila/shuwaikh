import 'package:flutter/material.dart';

import 'widgets/products_body.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductsScreenBody(),
    );
  }
}
