// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['qr-code-link'] as String?,
      json['message'] as String?,
      json['user'] == null
          ? null
          : UserData.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.userData,
      'qr-code-link': instance.qrCodeLink,
    };
