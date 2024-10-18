import 'package:bloc/bloc.dart';
import '/core/helpers/globals.dart' as globals;
part 'change_page_state.dart';

class ChangePageCubit extends Cubit<ChangePageState> {
  ChangePageCubit() : super(ChangePageState(currentPage: 0));
  void changePage(int currentPage) {
    globals.currentPage = currentPage;
    emit(ChangePageState(currentPage: currentPage));
  }

  void getPage() {
    int? currentPage = globals.currentPage;
    emit(ChangePageState(currentPage: currentPage!));
  }
}
