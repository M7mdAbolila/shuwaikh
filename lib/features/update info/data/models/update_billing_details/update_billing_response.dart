import 'package:freezed_annotation/freezed_annotation.dart';
part 'update_billing_response.g.dart';

@JsonSerializable()
class UpdateBillingResponse {
  final String? message;
  UpdateBillingResponse(this.message);
  factory UpdateBillingResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateBillingResponseFromJson(json);
}
