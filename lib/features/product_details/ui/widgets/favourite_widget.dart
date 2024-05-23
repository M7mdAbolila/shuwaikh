import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/Products_page/logic/cubit/reload_favourites_cubit.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import '../../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';

class FavouriteWidget extends StatefulWidget {
  const FavouriteWidget({
    super.key,
    required this.id,
  });
  final int? id;

  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
  @override
  void initState() {
    super.initState();
    context.read<GetFavouriteCubit>().getFavourites();
  }

  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocListener<GetFavouriteCubit, GetFavouriteState>(
          listener: (context, state) {
            if (state is GetFavouriteSuccess) {
              bool hasProduct = state.favourites!
                  .any((element) => element.productId == widget.id);
              if (hasProduct) {
                setState(() {
                  isFavourite = true;
                });
              }
            }
          },
          child: const SizedBox.shrink(),
        ),
        InkWell(
          onTap: () async {
            setState(() {
              isFavourite = !isFavourite;
            });
            await context
                .read<IsFavouriteCubit>()
                .isFavouriteStates(widget.id!);

            await context.read<GetFavouriteCubit>().getFavourites();
            context.read<ReloadFavouritesCubit>().reloadFavourite();
          },
          child: Icon(
            isFavourite ? Icons.favorite : Icons.favorite_border,
            color: ColorsManager.blue,
            size: 35,
          ),
        ),
        BlocListener<IsFavouriteCubit, IsFavouriteState>(
          listener: (context, state) {
            if (state is IsFavouriteFailure) {
              customSnackBar(context, state.errMessage, true);
            }
          },
          child: const SizedBox.shrink(),
        )
      ],
    );
  }
}
