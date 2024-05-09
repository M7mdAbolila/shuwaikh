import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shuwaikh/features/product_details/data/models/addons_model.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/addons.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/quantity_widget.dart';
import 'package:shuwaikh/features/product_details/ui/widgets/select_size_widget.dart';

import '../../../../core/helpers/spacing.dart';
import '../../data/models/product_details_response.dart';
import '../../data/models/variation_model.dart';
import 'product_info_and_is_favourite.dart';

class InfoPart extends StatelessWidget {
  const InfoPart({
    super.key,
    required this.productDetails,
  });
  final ProductDetails? productDetails;

  @override
  Widget build(BuildContext context) {
    Variation? variation;
    if (productDetails!.variations != null) {
      variation = jsonToVariation();
    }
    Addons? addons;
    if (productDetails!.addons != null) {
      addons = jsonToAddons();
    }

    return SliverFillRemaining(
      child: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  verticalSpace(35),
                  ProductInfoAndIsFavourite(
                    productDetails: productDetails,
                  ),
                  verticalSpace(15),
                  productDetails!.variations == null || variation!.sizes.isEmpty
                      ? const SizedBox.shrink()
                      : SelectSizeWidget(
                          variation: variation,
                        ),
                  productDetails!.addons == null || addons!.addons.isEmpty
                      ? const SizedBox.shrink()
                      : SelectAddons(
                          addons: addons,
                        ),
                  verticalSpace(10),
                  const QuantityWidget(),
                  verticalSpace(120),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Variation jsonToVariation() {
    String jsonString = productDetails!.variations ?? '';
    final jsonData = jsonDecode(jsonString);
    final variation = Variation.fromJson(jsonData);
    return variation;
  }

  Addons jsonToAddons() {
    String? jsonString = productDetails!.addons;
    final jsonData = jsonDecode(jsonString!);
    final addons = Addons.fromJson(jsonData);
    return addons;
  }
}
