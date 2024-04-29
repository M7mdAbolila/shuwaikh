// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeCategoryResponse _$HomeCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    HomeCategoryResponse(
      (json['categories'] as List<dynamic>?)
          ?.map((e) => HomeCategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeCategoryResponseToJson(
        HomeCategoryResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
    };

HomeCategoryModel _$HomeCategoryModelFromJson(Map<String, dynamic> json) =>
    HomeCategoryModel(
      id: json['id'] as int?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
    );

Map<String, dynamic> _$HomeCategoryModelToJson(HomeCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
