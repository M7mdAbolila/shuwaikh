import 'package:json_annotation/json_annotation.dart';

part 'my_orders_response.g.dart';

@JsonSerializable()
class MyOrdersResponse {
  final String? message;
  final List<Order>? orders;

  MyOrdersResponse({this.message, this.orders});
  factory MyOrdersResponse.fromJson(Map<String, dynamic> json) =>
      _$MyOrdersResponseFromJson(json);
}

@JsonSerializable()
class Order {
  final int? id;
  @JsonKey(name: 'order_number')
  final String? orderNumber;
  @JsonKey(name: 'order_status')
  final String? orderStatus;
  @JsonKey(name: 'payment_status')
  final String? paymentStatus;
  final String? total;
  final String? method;
  @JsonKey(name: 'shipping_method')
  final String? shippingMethod;

  Order({
    this.method,
    this.shippingMethod,
    this.id,
    this.orderNumber,
    this.orderStatus,
    this.paymentStatus,
    this.total,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);
}
