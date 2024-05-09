import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_service.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../../favourites/data/repos/is_favourite_repo.dart';
import '../../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';
import '../../data/models/product_details_response.dart';
import 'favourite_widget.dart';

class ProductInfoAndIsFavourite extends StatelessWidget {
  const ProductInfoAndIsFavourite({
    super.key,
    required this.productDetails,
  });
  final ProductDetails? productDetails;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              productDetails?.title ?? '',
              style: TextStyles.font24Black700Weight,
            ),
            BlocProvider(
              create: (context) =>
                  IsFavouriteCubit(IsFavouriteRepo(ApiService(Dio()))),
              child: FavouriteWidget(
                id: productDetails!.id,
              ),
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
                text: 'KD ${productDetails?.currentPrice}',
                style: TextStyles.font18Blue500Weight,
              ),
            ],
          ),
        ),
        verticalSpace(10),
        Text(
          AppRegex.removeHtmlTags(productDetails?.description ?? ''),
          style: TextStyles.font13Black500Weight,
          maxLines: 8,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
