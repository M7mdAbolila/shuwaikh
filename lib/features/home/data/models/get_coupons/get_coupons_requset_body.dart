
import 'package:json_annotation/json_annotation.dart';

part 'get_coupons_requset_body.g.dart';


@JsonSerializable()
class GetCouponsRequsetBody {
  final String lang ;
  GetCouponsRequsetBody({required this.lang});

 Map<String,dynamic> toJson() => _$GetCouponsRequsetBodyToJson(this);

}