
import 'package:json_annotation/json_annotation.dart';

part 'get_categories_requset_body.g.dart';

@JsonSerializable()
class GetCategoriesRequsetBody {
  final String lang ;

  GetCategoriesRequsetBody({required this.lang});


 Map<String,dynamic> toJson() => _$GetCategoriesRequsetBodyToJson(this);

}
