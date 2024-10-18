

import 'package:json_annotation/json_annotation.dart';

part 'get_categories_response.g.dart';

@JsonSerializable()
class GetCatogoriesResponse {
  final String? message;
  final List<Category>? categories;

  GetCatogoriesResponse({
    this.categories,
    this.message,
  });

  factory GetCatogoriesResponse.fromJson(Map<String, dynamic> json) =>
      _$GetCatogoriesResponseFromJson(json);
}

@JsonSerializable()
class Category {
  final int? id;
  final String? slug;
  final String? name;
  final String? image;

  Category({this.id, this.slug, this.name, this.image});

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}
