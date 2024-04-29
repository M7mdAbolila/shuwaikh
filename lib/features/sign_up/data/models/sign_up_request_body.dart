
import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String username;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  final String number;

  SignupRequestBody({
    required this.username,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
    required this.number,
  });

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}
