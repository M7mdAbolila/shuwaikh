// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'shipping_charge_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShippingChargeResponse _$ShippingChargeResponseFromJson(
        Map<String, dynamic> json) =>
    ShippingChargeResponse(
      message: json['message'] as String?,
      shipping: (json['shipping'] as List<dynamic>?)
          ?.map((e) => Shipping.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ShippingChargeResponseToJson(
        ShippingChargeResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'shipping': instance.shipping,
    };

Shipping _$ShippingFromJson(Map<String, dynamic> json) => Shipping(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      text: json['text'] as String?,
      charge: json['charge'] as String?,
      freeDeliveryAmout: json['free_delivery_amount'] as String?,
    );

Map<String, dynamic> _$ShippingToJson(Shipping instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'text': instance.text,
      'charge': instance.charge,
      'free_delivery_amount': instance.freeDeliveryAmout,
    };
