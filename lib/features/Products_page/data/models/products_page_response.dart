import 'package:json_annotation/json_annotation.dart';

import '../../../home/data/models/get_categories/get_categories_response.dart';

part 'products_page_response.g.dart';

@JsonSerializable()
class ProductsPageResponse {
  final String? message;
  final List<Category>? categories;
  final List<Product>? products;

  ProductsPageResponse({this.products,this.message, this.categories});

  factory ProductsPageResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductsPageResponseFromJson(json);
}

@JsonSerializable()
class Product {
  final int? id;
  final String? title;
  final String? slug;
  @JsonKey(name: 'category_id')
  final int? categoryId;
  @JsonKey(name: 'feature_image')
  final String? featureImage;
  @JsonKey(name: 'current_price')
  final String? currentPrice;
  @JsonKey(name: 'previous_price')
  final String? previousPrice;
  final String? addons;
  final String? variations;

  Product({
    this.id,
    this.title,
    this.slug,
    this.categoryId,
    this.featureImage,
    this.currentPrice,
    this.previousPrice,
    this.addons,
    this.variations,
  });

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
}
