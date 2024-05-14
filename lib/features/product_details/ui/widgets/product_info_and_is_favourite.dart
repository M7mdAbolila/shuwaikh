
import 'package:flutter/material.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/product_details_response.dart';
import 'favourite_widget.dart';

class ProductInfoAndIsFavourite extends StatefulWidget {
  const ProductInfoAndIsFavourite({
    super.key,
    required this.productDetails,
  });
  final ProductDetails? productDetails;

  @override
  State<ProductInfoAndIsFavourite> createState() =>
      _ProductInfoAndIsFavouriteState();
}

class _ProductInfoAndIsFavouriteState extends State<ProductInfoAndIsFavourite> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.productDetails?.title ?? '',
              style: TextStyles.font24Black700Weight,
            ),
            FavouriteWidget(
              id: widget.productDetails!.id,
            ),
          ],
        ),
        verticalSpace(5),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${S.of(context).price} ',
                style: TextStyles.font16Black400Weight,
              ),
              TextSpan(
                text: 'KD ${widget.productDetails?.currentPrice}',
                style: TextStyles.font18Blue500Weight,
              ),
            ],
          ),
        ),
        verticalSpace(10),
        Text(
          AppRegex.removeHtmlTags(widget.productDetails?.description ?? ''),
          style: TextStyles.font13Black500Weight,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
