import 'package:bloc/bloc.dart';

part 'calc_total_state.dart';

class CalcTotalCubit extends Cubit<CalcTotalState> {
  CalcTotalCubit() : super(CalcTotalState(0));
  double total = 0;
  double varPrice = 0;
  double addonsPrice = 0;
  int qty = 1;

  void calcTotal() {
    total = (varPrice * qty) + (addonsPrice * qty);
    emit(CalcTotalState(total));
  }

  void addAddonPrice(double addonPrice) {
    addonsPrice = addonsPrice + addonPrice;
  }
  void removeAddonPrice(double addonPrice) {
    addonsPrice = addonsPrice - addonPrice;
  }
}
