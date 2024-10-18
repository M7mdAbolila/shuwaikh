import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/helpers/file_converter.dart';

part 'update_profile_request_body.g.dart';

@JsonSerializable()
class UpdateProfileRequestBody {
  @FileConverter()
  final File? photo;
  final String? address;
  @JsonKey(name: 'new_password')
  final String? newPassword;
  @JsonKey(name: 'old_password')
  final String? oldPassword;

  UpdateProfileRequestBody(
      {this.address, this.newPassword, this.oldPassword, this.photo});

  Map<String, dynamic> toMultipartMap() {
    return {
      'photo': photo != null ? MultipartFile.fromFileSync(photo!.path) : null,
      'address': address,
      'new_password': newPassword,
      'old_password': oldPassword,
    };
  }
}
