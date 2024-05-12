// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequsetBody _$UpdateProfileRequsetBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequsetBody(
      json['address'] as String?,
      json['new_password'] as String?,
      json['old_password'] as String?,
    );

Map<String, dynamic> _$UpdateProfileRequsetBodyToJson(
        UpdateProfileRequsetBody instance) =>
    <String, dynamic>{
      'address': instance.address,
      'new_password': instance.newPassowrd,
      'old_password': instance.oldPassowrd,
    };
