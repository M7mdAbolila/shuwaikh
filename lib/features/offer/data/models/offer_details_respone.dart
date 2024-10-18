import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'offer_details_respone.g.dart';

@JsonSerializable()
class OfferDetailsResponse {
  String? message;
  Data? data;
  OfferDetailsResponse({this.data, this.message});
  factory OfferDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OfferDetailsResponseFromJson(json);
}

@JsonSerializable()
class Data {
  int? id;
  String? title;
  @JsonKey(name: 'end_date')
  String? endData;
  String? image;
  int? price;
  String? description;
  Data({
    this.id,
    this.description,
    this.endData,
    this.image,
    this.title,
    this.price,
  });
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
