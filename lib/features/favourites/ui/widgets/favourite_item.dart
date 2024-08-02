import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/features/favourites/data/models/get_favourites/get_favourites_response.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import '../../logic/is_favourite_cubit/is_favourite_cubit.dart';

class FavouriteItem extends StatefulWidget {
  const FavouriteItem({
    super.key,
    required this.favouriteProduct,
  });
  final FavouriteProduct favouriteProduct;
  @override
  State<FavouriteItem> createState() => _FavouriteItemState();
}

class _FavouriteItemState extends State<FavouriteItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.productDetailsScreen,
          arguments: widget.favouriteProduct.productId),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: Container(
          width: 335.w,
          height: 100.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: ColorsManager.lightBlue,
                offset: Offset(5, 5),
                blurRadius: 14,
                spreadRadius: -4,
              ),
            ],
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Container(
                  width: 100.w,
                  height: 100.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: CachedNetworkImageProvider(
                        '${ImagesPaths.productPath}${widget.favouriteProduct.image}',
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: isArabic()
                      ? EdgeInsets.only(right: 15.w)
                      : EdgeInsets.only(left: 15.w),
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 170.w,
                          child: Text(
                            '${widget.favouriteProduct.title}',
                            style: TextStyles.font24Black500Weight,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: '${S.of(context).price} ',
                                style: TextStyles.font16Black400Weight,
                              ),
                              TextSpan(
                                text: 'KD${widget.favouriteProduct.price}',
                                style: TextStyles.font18Blue500Weight,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                horizontalSpace(5),
                InkWell(
                  onTap: () => context
                      .read<IsFavouriteCubit>()
                      .isFavouriteStates(widget.favouriteProduct.productId!),
                  child: const Icon(
                    Icons.favorite,
                    color: ColorsManager.blue,
                    size: 35,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
