// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_orders_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MyOrdersResponse _$MyOrdersResponseFromJson(Map<String, dynamic> json) =>
    MyOrdersResponse(
      message: json['message'] as String?,
      orders: (json['orders'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MyOrdersResponseToJson(MyOrdersResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'orders': instance.orders,
    };

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      method: json['method'] as String?,
      shippingMethod: json['shipping_method'] as String?,
      id: (json['id'] as num?)?.toInt(),
      orderNumber: json['order_number'] as String?,
      orderStatus: json['order_status'] as String?,
      paymentStatus: json['payment_status'] as String?,
      total: json['total'] as String?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'order_number': instance.orderNumber,
      'order_status': instance.orderStatus,
      'payment_status': instance.paymentStatus,
      'total': instance.total,
      'method': instance.method,
      'shipping_method': instance.shippingMethod,
    };
