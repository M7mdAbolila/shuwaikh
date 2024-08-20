import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:shuwaikh/core/helpers/constants.dart';

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
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.productDetails?.title ?? unknown,
              style: AppTextStyles.font24Black700Weight,
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
                text: '${S.of(context).price}: ',
                style: AppTextStyles.font16Black400Weight,
              ),
              TextSpan(
                text: 'KD${widget.productDetails?.currentPrice}',
                style: AppTextStyles.font18Blue500Weight,
              ),
            ],
          ),
        ),
        verticalSpace(10),
        ReadMoreText(
          AppRegex.removeHtmlTags(
              widget.productDetails?.description ?? unknown),
          trimLines: 3,
          trimMode: TrimMode.Line,
          trimCollapsedText: S.of(context).read_more,
          trimExpandedText: S.of(context).read_less,
          style: AppTextStyles.font13Black500Weight,
          lessStyle: AppTextStyles.font11Blue500Weight,
          moreStyle: AppTextStyles.font11Blue500Weight,
        ),
      ],
    );
  }
}
