import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/change_category_cubit.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';
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
          width: 150.w,
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
                imageUrl:
                    'https://shuwaikhcoffee.com/assets/front/img/category/${widget.category.image}',
                height: 70.h,
                width: 70.w,
                fit: BoxFit.fill,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                child: Text(
                  widget.category.name ?? '',
                  style: TextStyles.font13Black500Weight,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
