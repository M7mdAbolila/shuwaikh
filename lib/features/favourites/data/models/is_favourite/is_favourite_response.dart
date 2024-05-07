import 'package:json_annotation/json_annotation.dart';
part 'is_favourite_response.g.dart';

@JsonSerializable()
class IsFavouritResponse {
  String? message;
  IsFavouritResponse({this.message});
  factory IsFavouritResponse.fromJson(Map<String, dynamic> json) =>
      _$IsFavouritResponseFromJson(json);
}
