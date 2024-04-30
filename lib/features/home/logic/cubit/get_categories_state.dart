part of 'get_categories_cubit.dart';

class GetCategoriesState {}

class GetCategoriesInitial extends GetCategoriesState {}

class GetCategorieLoading extends GetCategoriesState {}

class GetCategoriesSuccess extends GetCategoriesState {
  final List<Category>? categories;

  GetCategoriesSuccess(this.categories);
}

class GetCategoriesFailure extends GetCategoriesState {
  final String errMessage;

  GetCategoriesFailure(this.errMessage);

}
