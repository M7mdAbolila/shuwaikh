import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuwaikh/core/networking/api_constants.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_request_body.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_response.dart';
import 'package:shuwaikh/features/cart/data/models/remove_from_cart/remove_from_cart_request_body.dart';
import 'package:shuwaikh/features/favourites/data/models/get_favourites/get_favourites_response.dart';
import 'package:shuwaikh/features/favourites/data/models/is_favourite/is_favourite_request_body.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_categories/get_categories_response.dart';
import 'package:shuwaikh/features/home/data/models/get_coupons/get_coupons_response.dart';
import 'package:shuwaikh/features/home/data/models/get_offers/get_offers_requset_body.dart';
import 'package:shuwaikh/features/home/data/models/get_offers/get_offers_response.dart';
import 'package:shuwaikh/features/login/data/models/login_request_body.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';
import 'package:shuwaikh/features/logout/data/models/logout_response.dart';
import 'package:shuwaikh/features/offer/data/models/offer_details_respone.dart';
import 'package:shuwaikh/features/product_details/data/models/product_details_response.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_response.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_profile/update_profile_request_body.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_profile/update_profile_response.dart';

import '../../features/account/data/models/profile_response.dart';
import '../../features/cart/data/models/get_cart/get_cart_response.dart';
import '../../features/cart/data/models/remove_from_cart/remove_from_cart_response.dart';
import '../../features/favourites/data/models/is_favourite/is_favourite_response.dart';
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
    @Query("token") String? token,
    @Body() GetCategoriesRequsetBody getCategoriesRequsetBody,
  );

  @POST(ApiConstants.getOffers)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<GetOffersResponse> getOffers(
    @Query("token") String? token,
    @Body() GetOffersRequsetBody getOffersRequsetBody,
  );

  @POST(ApiConstants.productsPage)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<ProductsPageResponse> productsPage(
    @Query("token") String? token,
    @Body() ProductsPageRequestBody productsPageRequestBody,
  );

  @GET(ApiConstants.getCoupons)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<GetCouponsResponse> getCoupons(
    @Query("token") String? token,
  );

  @GET('${ApiConstants.productDetails}/{id}')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<ProductDetailsResponse> getProductDetails(
    @Path('id') String id,
    @Query("token") String? token,
  );

  @POST(ApiConstants.favourites)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<IsFavouritResponse> isFavourites(
    @Query("token") String? token,
    @Body() IsFavouriteRequestBody isFavouriteRequestBody,
  );

  @GET(ApiConstants.getFavourites)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<GetFavouritesResponse> getFavourites(
    @Query("token") String? token,
  );

  @POST(ApiConstants.logout)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<LogoutResponse> logout(
    @Query("token") String? token,
  );

  @GET('${ApiConstants.offerDetails}/{id}')
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<OfferDetailsResponse> getOfferDetails(
    @Path('id') String id,
    @Query("token") String? token,
  );

  @POST(ApiConstants.addToCart)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<AddToCartResponse> addToCart(
    @Query("token") String? token,
    @Body() AddToCartRequestBody addToCartRequestBody,
  );

  @GET(ApiConstants.getCart)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<GetCartResponse> getCart(
    @Query("token") String? token,
  );

  @POST(ApiConstants.removeFromCart)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<RemoveFromCartResponse> removeFromCart(
    @Query("token") String? token,
    @Body() RemoveFromCartRequestBody removeFromCartRequestBody,
  );

  @GET(ApiConstants.profile)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<ProfileResponse> getProfileData(
    @Query("token") String? token,
  );

   @POST(ApiConstants.updateProfile)
  @Headers(<String, dynamic>{
    'Accept': 'application/json',
  })
  Future<UpdateProfileResponse> updateProfile(
    @Query("token") String? token,
    @Body() UpdateProfileRequsetBody updateProfileRequsetBody ,
  );
}
