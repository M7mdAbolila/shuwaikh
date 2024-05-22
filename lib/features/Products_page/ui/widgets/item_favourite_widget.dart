import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/custom_snack_bar.dart';
import '../../../../core/theming/colors.dart';
import '../../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';

// ignore: must_be_immutable
class ItemFavouriteWidget extends StatefulWidget {
  ItemFavouriteWidget({
    super.key,
    required this.id,
    required this.isFavourite,
  });
  final int? id;
  bool isFavourite;

  @override
  State<ItemFavouriteWidget> createState() => _ItemFavouriteWidgetState();
}

class _ItemFavouriteWidgetState extends State<ItemFavouriteWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
            size: 25,
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
