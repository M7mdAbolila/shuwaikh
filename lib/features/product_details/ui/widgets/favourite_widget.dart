
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/colors.dart';
import '../../../favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    super.key,
    required this.id,
  });
  final int? id;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.read<IsFavouriteCubit>().isFavouriteStates(id!),
      child: BlocBuilder<IsFavouriteCubit, IsFavouriteSuccess>(
        builder: (context, state) {
          return Icon(
            state.isfavourite! ? Icons.favorite : Icons.favorite_border,
            color: ColorsManager.blue,
            size: 35,
          );
        },
      ),
    );
  }
}

