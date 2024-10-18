import 'package:json_annotation/json_annotation.dart';

part 'delete_account_reponse.g.dart';

@JsonSerializable()
class DeleteAccountReponse {
  final String? message;

  DeleteAccountReponse({this.message});
  factory DeleteAccountReponse.fromJson(Map<String, dynamic> json) =>
      _$DeleteAccountReponseFromJson(json);
}
