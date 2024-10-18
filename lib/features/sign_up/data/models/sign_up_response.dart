import 'package:json_annotation/json_annotation.dart';

part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  final String? message;
  @JsonKey(name: 'user')
  final UserData? userData;

  SignupResponse({this.message, this.userData}); 

 factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);

}


@JsonSerializable()
class UserData {
  final int? id;
  final String? username;
  final String? email;
  final String? number;

  UserData({this.id, this.username, this.email, this.number});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
