import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/checkout/data/models/order_request_body.dart';
import 'package:shuwaikh/features/checkout/data/models/order_response.dart';
import 'package:shuwaikh/features/checkout/data/repos/order_repo.dart';

part 'place_order_state.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final OrderRepo _orderRepo;
  PlaceOrderCubit(this._orderRepo) : super(PlaceOrderState());
  final formKey = GlobalKey<FormState>();
  bool selectCharges = false;
  bool useSavedDetails = false;
  TextEditingController shippingFname = TextEditingController();
  TextEditingController shippingLname = TextEditingController();
  TextEditingController shippingEmail = TextEditingController();
  TextEditingController shippingNumber = TextEditingController();
  TextEditingController shippingCity = TextEditingController();
  TextEditingController shippingAddress = TextEditingController();
  int? sameAsShipping;
  TextEditingController billingAddress = TextEditingController();
  TextEditingController billingCity = TextEditingController();
  TextEditingController billingEmail = TextEditingController();
  TextEditingController billingFname = TextEditingController();
  TextEditingController billingLname = TextEditingController();
  TextEditingController billingNumber = TextEditingController();
  double? discount;
  int? shippingCharge;
  String? gateway;

  Future<void> placeOrder() async {
    emit(PlaceOrderLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();

    var result = await _orderRepo.placeOrder(
      token,
      OrderRequestBody(
        shippingFname: shippingFname.text,
        shippingLname: shippingLname.text,
        shippingEmail: shippingEmail.text,
        shippingNumber: shippingNumber.text,
        shippingCity: shippingCity.text,
        shippingAddress: shippingAddress.text,
        sameAsShipping: sameAsShipping,
        shippingCharge: shippingCharge!,
        billingAddress: billingAddress.text,
        billingCity: billingCity.text,
        billingEmail: billingEmail.text,
        billingFname: billingFname.text,
        billingLname: billingLname.text,
        billingNumber: billingNumber.text,
        discount: discount,
        gateway: gateway!,
      ),
    );
    result.fold(
        (failure) => emit(
              PlaceOrderFailure(failure.errMessage),
            ), (response) {
      emit(
        PlaceOrderSuccess(response),
      );
    });
  }
}
