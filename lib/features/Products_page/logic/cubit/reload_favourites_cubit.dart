import 'package:bloc/bloc.dart';

part 'reload_favourites_state.dart';

class ReloadFavouritesCubit extends Cubit<ReloadFavouritesState> {
  ReloadFavouritesCubit() : super(ReloadFavouritesState());
  void reloadFavourite() {
    emit(ReloadFavouritesState());
  }
}
