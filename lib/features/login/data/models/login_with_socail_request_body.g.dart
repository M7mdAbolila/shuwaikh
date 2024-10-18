// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_with_socail_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginWithSocailRequestBody _$LoginWithSocailRequestBodyFromJson(
        Map<String, dynamic> json) =>
    LoginWithSocailRequestBody(
      email: json['email'] as String,
      username: json['username'] as String,
      photoUrl: json['photo'] as String?,
      providerId: json['provider_id'] as String,
      provider: json['provider'] as String,
    );

Map<String, dynamic> _$LoginWithSocailRequestBodyToJson(
        LoginWithSocailRequestBody instance) =>
    <String, dynamic>{
      'email': instance.email,
      'username': instance.username,
      'photo': instance.photoUrl,
      'provider_id': instance.providerId,
      'provider': instance.provider,
    };
