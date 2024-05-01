import 'package:json_annotation/json_annotation.dart';

part 'get_offers_requset_body.g.dart';


@JsonSerializable()
class GetOffersRequsetBody {
  final String lang ;

  GetOffersRequsetBody({required this.lang});


 Map<String,dynamic> toJson() => _$GetOffersRequsetBodyToJson(this);

}