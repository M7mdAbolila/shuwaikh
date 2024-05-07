import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/core/widgets/custom_error_widget.dart';
import 'package:shuwaikh/core/widgets/custom_loading_widget.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/favourites/ui/widgets/favourite_item.dart';

class FavouritesScreenBody extends StatefulWidget {
  const FavouritesScreenBody({super.key});

  @override
  State<FavouritesScreenBody> createState() => _FavouritesScreenBodyState();
}

class _FavouritesScreenBodyState extends State<FavouritesScreenBody> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<GetFavouriteCubit>().getFavourites();
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavouriteCubit, GetFavouriteState>(
      builder: (context, state) {
        if (state is GetFavouriteSuccess) {
          return Container(
            child: state.favourites!.isEmpty
                ? const CustomErrorWidget(
                    errMessage: 'No Product Found In Your Wishlist',
                  )
                : ListView.builder(
                    itemCount: state.favourites!.length,
                    itemBuilder: (context, index) {
                      return FavouriteItem(
                        favouriteProduct: state.favourites![index],
                      );
                    },
                  ),
          );
        } else if (state is GetFavouriteFailure) {
          return CustomErrorWidget(
            errMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingWidget();
        }
      },
    );
  }
}
