import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import '../../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';

// ignore: must_be_immutable
class FavouriteWidget extends StatefulWidget {
  FavouriteWidget({
    super.key,
    required this.id,
  });
  final int? id;
  bool isFavourite = false;
  @override
  State<FavouriteWidget> createState() => _FavouriteWidgetState();
}

class _FavouriteWidgetState extends State<FavouriteWidget> {
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
                  widget.isFavourite = true;
                });
              }
            }
          },
          child: const SizedBox.shrink(),
        ),
        InkWell(
          onTap: () {
            context.read<IsFavouriteCubit>().isFavouriteStates(widget.id!);
            setState(() {
              widget.isFavourite = !widget.isFavourite;
            });
          },
          child: Icon(
            widget.isFavourite ? Icons.favorite : Icons.favorite_border,
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
