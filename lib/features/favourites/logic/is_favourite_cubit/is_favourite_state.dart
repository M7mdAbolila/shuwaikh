part of 'is_favourite_cubit.dart';

class IsFavouriteState {
  
}

class IsFavouriteSuccess extends IsFavouriteState {
  bool? isfavourite = false;
  IsFavouriteSuccess(this.isfavourite);
}

class IsFavouriteFailure extends IsFavouriteState{
  final String? errMessage;

  IsFavouriteFailure(this.errMessage);
}
