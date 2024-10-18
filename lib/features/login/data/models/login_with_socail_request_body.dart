import 'package:json_annotation/json_annotation.dart';

part 'login_with_socail_request_body.g.dart';

@JsonSerializable()
class LoginWithSocailRequestBody {
  final String email;
  final String username;
  @JsonKey(name: 'photo')
  final String? photoUrl;
  @JsonKey(name: 'provider_id')
  final String providerId;
  final String provider;

  LoginWithSocailRequestBody({
    required this.email,
    required this.username,
    this.photoUrl,
    required this.providerId,
    required this.provider,
  });

  Map<String, dynamic> toJson() => _$LoginWithSocailRequestBodyToJson(this);
}
