import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/spacing.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/change_category_cubit.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';
import 'package:shuwaikh/features/nav_bar/cubit/change_page_cubit.dart';
import '../../../../core/helpers/is_arabic.dart';
import '../../../../core/theming/styles.dart';

class CategoryItem extends StatefulWidget {
  const CategoryItem({super.key, required this.category});
  final Category category;

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          context.read<ChangePageCubit>().changePage(2);
          context
              .read<ChangeCategoryCubit>()
              .changeCategory(widget.category.id!, widget.category.name!);
        });
      },
      child: Padding(
        padding: isArabic()
            ? const EdgeInsets.only(left: 8, right: 2, top: 4, bottom: 4)
            : const EdgeInsets.only(left: 2, right: 8, top: 4, bottom: 4),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: ColorsManager.lightBlue,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 0,
                blurRadius: 8,
              ),
            ],
          ),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: isArabic() ? '$catigoryPath${widget.category.image == '6633c017c2822.avif'  ?  '6633c0e14fc67.png' : widget.category.image }':
                    '$catigoryPath${widget.category.image == '6633bfef42c63.avif' ?  '6633c0e14fc67.png' : widget.category.image }',
                height: 60.h,
                width: 60.w,
                fit: BoxFit.fill,
              ),
              horizontalSpace(20),
              Text(
                widget.category.name ?? '',
                style: TextStyles.font20Black500Weight,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
