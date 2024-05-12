import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  final String? message;
  @JsonKey(name: 'user')
  final UserData? userData;
  @JsonKey(name: 'qr-code-link')
  final String? qrCodeLink;

  ProfileResponse(this.qrCodeLink, this.message, this.userData);

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
