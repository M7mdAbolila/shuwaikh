// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_details_respone.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferDetailsResponse _$OfferDetailsResponseFromJson(
        Map<String, dynamic> json) =>
    OfferDetailsResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$OfferDetailsResponseToJson(
        OfferDetailsResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      id: (json['id'] as num?)?.toInt(),
      description: json['description'] as String?,
      endData: json['end_date'] as String?,
      image: json['image'] as String?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'end_date': instance.endData,
      'image': instance.image,
      'price': instance.price,
      'description': instance.description,
    };
