import 'package:json_annotation/json_annotation.dart';

part 'products_page_request_body.g.dart';

@JsonSerializable()
class ProductsPageRequestBody {
  final String lang;

  ProductsPageRequestBody({required this.lang});

  Map<String, dynamic> toJson() => _$ProductsPageRequestBodyToJson(this);
}
