// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_offers_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetOffersResponse _$GetOffersResponseFromJson(Map<String, dynamic> json) =>
    GetOffersResponse(
      offers: (json['offers'] as List<dynamic>?)
          ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
          .toList(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$GetOffersResponseToJson(GetOffersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'offers': instance.offers,
    };

Offer _$OfferFromJson(Map<String, dynamic> json) => Offer(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$OfferToJson(Offer instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'image': instance.image,
    };
