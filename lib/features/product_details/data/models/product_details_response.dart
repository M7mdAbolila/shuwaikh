import 'package:json_annotation/json_annotation.dart';
part 'product_details_response.g.dart';

@JsonSerializable()
class ProductDetailsResponse {
  String? message;
  Data? data;

  ProductDetailsResponse({
    this.message,
    this.data,
  });
  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsResponseFromJson(json);
}

@JsonSerializable()
class Data {
  @JsonKey(name: 'product')
  ProductDetails? productDetails;

  Data({
    this.productDetails,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@JsonSerializable()
class ProductDetails {
  int? id;
  String? title;
  String? slug;
  @JsonKey(name: 'previous_price')
  String? previousPrice;
  @JsonKey(name: 'current_price')
  String? currentPrice;
  String? summary;
  String? description;
  String? addons;
  String? variations;
  @JsonKey(name: 'feature_image')
  String? featureImage;
  String? category;
  @JsonKey(name: 'product_images')
  List<ProductImage>? productImages;

  ProductDetails({
    this.id,
    this.title,
    this.slug,
    this.previousPrice,
    this.currentPrice,
    this.summary,
    this.description,
    this.addons,
    this.variations,
    this.featureImage,
    this.category,
    this.productImages,
  });
  factory ProductDetails.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailsFromJson(json);
}

@JsonSerializable()
class ProductImage {
  int? id;
  @JsonKey(name: 'product_id')
  int? productId;
  String? image;

  ProductImage({
    this.id,
    this.productId,
    this.image,
  });
  factory ProductImage.fromJson(Map<String, dynamic> json) =>
      _$ProductImageFromJson(json);
}
