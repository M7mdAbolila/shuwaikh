

import 'package:json_annotation/json_annotation.dart';

part 'get_offers_response.g.dart';



@JsonSerializable()
class GetOffersResponse {
  final String? message;
  final List<Offer>? offers;

  GetOffersResponse({
    this.offers,
    this.message,
  });

  factory GetOffersResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOffersResponseFromJson(json);
}

@JsonSerializable()
class Offer {
  final int? id;
  final String? title;
  final int? price;
  final String? image;

  Offer({this.id, this.title, this.price, this.image});

  factory Offer.fromJson(Map<String, dynamic> json) =>
      _$OfferFromJson(json);
}
