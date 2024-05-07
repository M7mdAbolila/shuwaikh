// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_favourite_cubit.dart';

class GetFavouriteState {}

class GetFavouriteLoading extends GetFavouriteState {}

class GetFavouriteSuccess extends GetFavouriteState {
  List<FavouriteProduct>? favourites;
  GetFavouriteSuccess(this.favourites);
}

class GetFavouriteFailure extends GetFavouriteState {
  String errMessage;
  GetFavouriteFailure(this.errMessage);
}
