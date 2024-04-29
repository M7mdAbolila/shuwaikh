
import 'package:json_annotation/json_annotation.dart';
part 'category_response.g.dart';

@JsonSerializable()
class HomeCategoryResponse {
  List<HomeCategoryModel>? categories;
  HomeCategoryResponse(this.categories);
}

@JsonSerializable()
class HomeCategoryModel {
  int? id;
  String? name;
  String? slug; 
  String? image;
  HomeCategoryModel({this.id, this.image, this.name, this.slug});

  factory HomeCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$HomeCategoryModelFromJson(json);
}
