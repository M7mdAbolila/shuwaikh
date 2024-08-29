// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_page_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsPageResponse _$ProductsPageResponseFromJson(
        Map<String, dynamic> json) =>
    ProductsPageResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductsPageResponseToJson(
        ProductsPageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'categories': instance.categories,
      'products': instance.products,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      categoryId: (json['category_id'] as num?)?.toInt(),
      featureImage: json['feature_image'] as String?,
      currentPrice: json['current_price'] as String?,
      previousPrice: json['previous_price'] as String?,
      addons: json['addons'] as String?,
      variations: json['variations'] as String?,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'category_id': instance.categoryId,
      'feature_image': instance.featureImage,
      'current_price': instance.currentPrice,
      'previous_price': instance.previousPrice,
      'addons': instance.addons,
      'variations': instance.variations,
    };
