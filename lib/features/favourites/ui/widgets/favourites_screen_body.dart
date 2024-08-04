import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/favourites/ui/widgets/favourite_bloc_listener.dart';
import 'package:shuwaikh/features/favourites/ui/widgets/favourite_item.dart';

class FavouritesScreenBody extends StatefulWidget {
  const FavouritesScreenBody({super.key});

  @override
  State<FavouritesScreenBody> createState() => _FavouritesScreenBodyState();
}

class _FavouritesScreenBodyState extends State<FavouritesScreenBody> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, state) {
        if (state is GetFavouriteSuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
            child: ListView(
              children: [
                state.favourites!.isEmpty
                    ? const CustomErrMessageWidget(
                        errMessage: 'No Product Found In Your Wishlist',
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.favourites!.length,
                        reverse: true,
                        itemBuilder: (context, index) {
                          return FavouriteItem(
                            favouriteProduct: state.favourites![index],
                          );
                        },
                      ),
                const UpdateFavouriteBlocListener(),
              ],
            ),
          );
        } else if (state is GetFavouriteFailure) {
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
