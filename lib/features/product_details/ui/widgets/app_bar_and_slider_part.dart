import 'package:flutter/material.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/product_details_response.dart';
import 'app_bar.dart';
import 'product_images_slider.dart';

class AppBarAndSliderPart extends StatelessWidget {
  const AppBarAndSliderPart({
    super.key,
    required this.productDetails,
  });
  final ProductDetails? productDetails;
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          verticalSpace(15),
          const ProductDetailsAppBar(),
          verticalSpace(10),
          ProductImagesSlider(
            productDetails: productDetails,
          ),
          verticalSpace(25),
        ],
      ),
    );
  }
}
