import 'package:flutter/material.dart';

import 'widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.id});
  final int? id;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: ProductDetailsScreenBody(id: id,),
    );
  }
}
