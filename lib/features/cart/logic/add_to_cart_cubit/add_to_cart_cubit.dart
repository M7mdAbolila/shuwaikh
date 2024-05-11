import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/cart/data/models/add_to_cart/add_to_cart_request_body.dart';
import 'package:shuwaikh/features/cart/data/repos/add_to_cart_repo.dart';

part 'add_to_cart_state.dart';

class AddToCartCubit extends Cubit<AddToCartState> {
  AddToCartCubit(this._addToCartRepo) : super(AddToCartState());
  final AddToCartRepo _addToCartRepo;
  int? productId;
  String? title;
  int? qty;
  double? productPrice;
  double? variationsPrice;
  double addonsPrice = 0;
  double? total;
  String? variations;
  String? defaultVariations;
  String? addons;

  List<String> adds = [];
  void addAddons(String add) {
    adds.add(add);
    addons = adds.toString();
  }

  void calcAddons(double addon) {
    addonsPrice += addon;
  }

  Future<void> addToCart() async {
    emit(AddToCartLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _addToCartRepo.addToCart(
      token,
      AddToCartRequestBody(
        productId: productId,
        title: title,
        qty: qty ?? 1,
        productPrice: variationsPrice ?? productPrice,
        variationsPrice: variationsPrice ?? productPrice,
        addonsPrice: addonsPrice,
        total: total =
            ((variationsPrice ?? productPrice! + addonsPrice) * qty!),
        variations: variations ?? defaultVariations,
        addons: addons,
      ),
    );
    result.fold(
      (failure) => emit(
        AddToCartFailure(failure.errMessage),
      ),
      (response) => emit(
        AddToCartSuccess(response.message),
      ),
    );
  }
}
