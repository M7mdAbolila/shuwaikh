import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shuwaikh/features/favourites/logic/get_favourite_cubit/get_favourite_cubit.dart';
import 'package:shuwaikh/features/favourites/logic/is_favourite_cubit/is_favourite_cubit.dart';

class UpdateFavouriteBlocListener extends StatefulWidget {
  const UpdateFavouriteBlocListener({super.key});

  @override
  State<UpdateFavouriteBlocListener> createState() =>
      _UpdateFavouriteBlocListenerState();
}

class _UpdateFavouriteBlocListenerState
    extends State<UpdateFavouriteBlocListener> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<IsFavouriteCubit, IsFavouriteSuccess>(
      listener: (context, state) {
        setState(() {
          context.read<GetFavouriteCubit>().getFavourites();
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}
