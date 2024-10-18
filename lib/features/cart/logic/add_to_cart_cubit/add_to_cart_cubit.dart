import 'package:bloc/bloc.dart';
import 'package:intl/intl.dart';
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
  double? total = 0;
  String? variations;
  String? defaultVariations;
  String? addons;

  List<String> adds = [];
  void addAddons(String add) {
    adds.add(add);
    addons = adds.toString();
  }

  void removeAddon(String add) {
    adds.remove(add);
    addons = adds.toString();
  }

  void addAddonsPrice(double addon) {
    addonsPrice += addon;
  }

  void removeAddonsPrice(double addon) {
    addonsPrice -= addon;
  }

  Future<void> addToCart() async {
    emit(AddToCartLoading());
    total = (((variationsPrice)! * qty!) + (addonsPrice * qty!));
    addonsPrice = (addonsPrice * qty!);
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
        total: total,
        variations: '{"size":${variations ?? defaultVariations}}',
        addons: addons,
      ),
    );
    final locale = Intl.getCurrentLocale();
    result.fold(
      (failure) => emit(
        AddToCartFailure(failure.errMessage),
      ),
      (response) {
        if (locale == 'en') {
          emit(
            AddToCartSuccess(response.message),
          );
        } else {
          emit(
            AddToCartSuccess('تمت إضافة العنصر إلى سلة التسوق بنجاح'),
          );
        }
      },
    );
  }
}
