import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:shuwaikh/core/networking/api_constants.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_request_body.dart';
import 'package:shuwaikh/features/Products_page/data/models/products_page_response.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_response.dart';
import 'package:shuwaikh/features/cart/data/models/remove_from_cart/remove_from_cart_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/order_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/order_response.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/shipping_charge_response.dart';
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
import 'package:shuwaikh/features/my_orders/data/models/my_orders_response.dart';
import 'package:shuwaikh/features/offer/data/models/offer_details_respone.dart';
import 'package:shuwaikh/features/product_details/data/models/product_details_response.dart';
import 'package:shuwaikh/features/setting/data/models/delete_account_reponse.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:shuwaikh/features/sign_up/data/models/sign_up_response.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_billing_details/update_billing_request_body.dart';
import 'package:shuwaikh/features/update%20info/data/models/update_profile/update_profile_response.dart';

import '../../features/account/data/models/profile_response.dart';
import '../../features/cart/data/models/get_cart/get_cart_response.dart';
import '../../features/cart/data/models/remove_from_cart/remove_from_cart_response.dart';
import '../../features/favourites/data/models/is_favourite/is_favourite_response.dart';
import '../../features/login/data/models/login_with_socail_request_body.dart';
import '../../features/update info/data/models/update_shipping_details/update_shipping_request_body.dart';
import '../../features/update info/data/models/update_shipping_details/update_shipping_response.dart';
import '../../features/vouncher/data/models/check_coupon_request_body.dart';
import '../../features/vouncher/data/models/check_coupon_response.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);

  @POST(ApiConstants.loginWithSocail)
  Future<LoginResponse> loginWithSocail(
    @Body() LoginWithSocailRequestBody loginWithSocailRequestBody,
  );

  @POST(ApiConstants.register)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  @POST(ApiConstants.getCategories)
  Future<GetCatogoriesResponse> getCategories(
    @Query("token") String? token,
    @Body() GetCategoriesRequsetBody getCategoriesRequsetBody,
  );

  @POST(ApiConstants.getOffers)
  Future<GetOffersResponse> getOffers(
    @Query("token") String? token,
    @Body() GetOffersRequsetBody getOffersRequsetBody,
  );

  @POST(ApiConstants.productsPage)
  Future<ProductsPageResponse> productsPage(
    @Query("token") String? token,
    @Body() ProductsPageRequestBody productsPageRequestBody,
  );

  @GET(ApiConstants.getCoupons)
  Future<GetCouponsResponse> getCoupons(
    @Query("token") String? token,
  );

  @GET('${ApiConstants.productDetails}/{id}')
  Future<ProductDetailsResponse> getProductDetails(
    @Path('id') String id,
    @Query("token") String? token,
  );

  @POST(ApiConstants.favourites)
  Future<IsFavouritResponse> isFavourites(
    @Query("token") String? token,
    @Body() IsFavouriteRequestBody isFavouriteRequestBody,
  );

  @GET(ApiConstants.getFavourites)
  Future<GetFavouritesResponse> getFavourites(
    @Query("token") String? token,
  );

  @POST(ApiConstants.logout)
  Future<LogoutResponse> logout(
    @Query("token") String? token,
  );

  @GET('${ApiConstants.offerDetails}/{id}')
  Future<OfferDetailsResponse> getOfferDetails(
    @Path('id') String id,
    @Query("token") String? token,
  );

  @POST(ApiConstants.addToCart)
  Future<AddToCartResponse> addToCart(
    @Query("token") String? token,
    @Body() AddToCartRequestBody addToCartRequestBody,
  );

  @GET(ApiConstants.getCart)
  Future<GetCartResponse> getCart(
    @Query("token") String? token,
  );

  @POST(ApiConstants.removeFromCart)
  Future<RemoveFromCartResponse> removeFromCart(
    @Query("token") String? token,
    @Body() RemoveFromCartRequestBody removeFromCartRequestBody,
  );

  @GET(ApiConstants.profile)
  Future<ProfileResponse> getProfileData(
    @Query("token") String? token,
  );

  @POST(ApiConstants.updateProfile)
  @MultiPart()
  Future<UpdateProfileResponse> updateProfile(
    @Query("token") String? token,
    @Part() File? photo,
    @Part() String? address,
    @Part(name: 'new_password') String? newPassword,
    @Part(name: 'old_password') String? oldPassword,
  );

  @POST(ApiConstants.updateBilling)
  Future<UpdateProfileResponse> updateBilling(
    @Query("token") String? token,
    @Body() UpdateBillingRequsetBody updateBillingRequsetBody,
  );

  @POST(ApiConstants.updateShipping)
  Future<UpdateShippingResponse> updateShipping(
    @Query("token") String? token,
    @Body() UpdateShippingRequsetBody updateShippingRequsetBody,
  );

  @POST(ApiConstants.placeOrder)
  Future<OrderResponse> placeOrder(
    @Query("token") String? token,
    @Body() OrderRequestBody orderRequestBody,
  );

  @POST(ApiConstants.shippingCharge)
  Future<ShippingChargeResponse> shippingCharge(
    @Query("token") String? token,
    @Body() ShippingChargeRequsetBody shippingChargeRequsetBody,
  );

  @POST(ApiConstants.checkCoupon)
  Future<CheckCouponResponse> checkCoupon(
    @Query("token") String? token,
    @Body() CheckCouponRequsetBody checkCouponRequestBody,
  );

  @GET(ApiConstants.myOrders)
  Future<MyOrdersResponse> getMyOrder(
    @Query("token") String? token,
  );

  @GET(ApiConstants.unactiveAccount)
  Future<DeleteAccountReponse> unactiveAccount(
    @Query("token") String? token,
  );
}
