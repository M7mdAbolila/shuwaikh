import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequsetBody {
  final String? address;
  @JsonKey(name: 'new_password')
  final String? newPassowrd;
  @JsonKey(name: 'old_password')
  final String? oldPassowrd;

  UpdateProfileRequsetBody(this.address, this.newPassowrd, this.oldPassowrd);

  Map<String, dynamic> toJson() => _$UpdateProfileRequsetBodyToJson(this);
}
