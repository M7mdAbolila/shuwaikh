import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuwaikh/core/networking/api_constants.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';
import 'package:shuwaikh/features/login/data/models/login_request_body.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.register)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.getCategories)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<GetCatogoriesResponse> getCategories(
    @Body() GetCategoriesRequsetBody getCategoriesRequsetBody,
  );
}
