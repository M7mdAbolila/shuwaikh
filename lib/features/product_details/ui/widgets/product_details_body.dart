import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/theming/colors.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/product_details/logic/product_details_cubit/product_details_cubit.dart';

import 'app_bar_and_slider_part.dart';
import 'info_part.dart';
import 'product_nav_bar.dart';

class ProductDetailsScreenBody extends StatefulWidget {
  const ProductDetailsScreenBody({super.key, this.id});
  final int? id;
  @override
  State<ProductDetailsScreenBody> createState() =>
      _ProductDetailsScreenBodyState();
}

class _ProductDetailsScreenBodyState extends State<ProductDetailsScreenBody> {
  @override
  void initState() {
    super.initState();
    context.read<ProductDetailsCubit>().getProductDetails(widget.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsSuccess) {
          return Stack(
            children: [
              Container(
                color: AppColors.blue,
                child: SafeArea(
                  child: CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      // ======== App bar and images slider part =========
                      AppBarAndSliderPart(
                        productDetails: state.productDetails,
                      ),
                      // ======= info part ==========
                      InfoPart(
                        productDetails: state.productDetails,
                      ),
                    ],
                  ),
                ),
              ),
              const ProductNavBar(),
            ],
          );
        } else if (state is ProductDetailsFailure) {
          return CustomErrMessageWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
