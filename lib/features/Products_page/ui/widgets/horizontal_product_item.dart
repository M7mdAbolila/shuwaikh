import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';

import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/colors.dart';
import '../../../../core/theming/styles.dart';
import '../../../../generated/l10n.dart';

class HorizontalProductItem extends StatelessWidget {
  const HorizontalProductItem({
    super.key,
    required this.product,
  });
  final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.pushNamed(Routes.productDetailsScreen, arguments: product.id),
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
          child: Row(
            children: [
              Container(
                width: 100.w,
                height: 100.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: CachedNetworkImageProvider(
                        '$productPath${product.featureImage}'),
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
                        width: 160.w,
                        child: Text(
                          product.title ?? '',
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
                              text: 'KD${product.currentPrice ?? ''}',
                              style: TextStyles.font18Blue500Weight,
                            ),
                          ],
                        ),
                      ),
                      // verticalSpace(20),
                      Row(
                        children: [
                          const Icon(
                            Icons.favorite,
                            color: Colors.red,
                            size: 18,
                          ),
                          horizontalSpace(2),
                          const Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 18,
                          ),
                          Text(
                            '4.5',
                            style: TextStyles.font11Black500Weight,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const CircleAvatar(
                radius: 20,
                backgroundColor: ColorsManager.mainBlue,
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
