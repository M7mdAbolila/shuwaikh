// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_request_body.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileRequestBody _$UpdateProfileRequestBodyFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileRequestBody(
      address: json['address'] as String?,
      newPassword: json['new_password'] as String?,
      oldPassword: json['old_password'] as String?,
      photo: const FileConverter().fromJson(json['photo'] as String?),
    );

Map<String, dynamic> _$UpdateProfileRequestBodyToJson(
        UpdateProfileRequestBody instance) =>
    <String, dynamic>{
      'photo': const FileConverter().toJson(instance.photo),
      'address': instance.address,
      'new_password': instance.newPassword,
      'old_password': instance.oldPassword,
    };
