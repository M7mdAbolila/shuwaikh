import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/my_orders/data/repos/my_orders_repo.dart';

import '../../data/models/my_orders_response.dart';

part 'my_orders_state.dart';

class MyOrdersCubit extends Cubit<MyOrdersState> {
  final MyOrdersRepo _myOrdersRepo;
  MyOrdersCubit(this._myOrdersRepo) : super(MyOrdersState());

  Future<void> getMyOrders() async {
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _myOrdersRepo.getMyOrders(token);
    result.fold(
      (failure) => emit(
        MyOrdersFailure(failure.errMessage),
      ),
      (response) => emit(
        MyOrdersSuccess(response.orders),
      ),
    );
  }
}
