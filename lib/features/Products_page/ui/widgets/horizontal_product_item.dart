import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';
import 'item_favourite_widget.dart';

class HorizontalProductItem extends StatefulWidget {
  const HorizontalProductItem({
    super.key,
    required this.product,
    this.isFavourite = false,
  });
  final Product product;
  final bool? isFavourite;
  @override
  State<HorizontalProductItem> createState() => _HorizontalProductItemState();
}

class _HorizontalProductItemState extends State<HorizontalProductItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(Routes.productDetailsScreen,
          arguments: widget.product.id),
      child: Padding(
        padding: EdgeInsets.only(bottom: 15.h),
        child: Container(
          width: 335.w,
          height: 115.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: ColorsManager.lightBlue,
                offset: Offset(5, 5),
                blurRadius: 14,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Row(
            children: [
              Container(
                width: 110.w,
                height: 110.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                      '$productPath${widget.product.featureImage}',
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
                        width: 155.w,
                        child: Text(
                          widget.product.title ?? '',
                          style: TextStyles.font20Black500Weight,
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
                              text: 'KD${widget.product.currentPrice ?? ''}',
                              style: TextStyles.font18Blue500Weight,
                            ),
                          ],
                        ),
                      ),
                      ItemFavouriteWidget(
                        id: widget.product.id,
                        isFavourite: widget.isFavourite!,
                      ),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: ColorsManager.blue,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
