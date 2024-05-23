import 'package:bloc/bloc.dart';
import '/core/helpers/globals.dart' as globals;
part 'change_category_state.dart';

class ChangeCategoryCubit extends Cubit<ChangeCategoryState> {
  ChangeCategoryCubit() : super(ChangeCategoryState());
  void changeCategory(int id, String name) {
    globals.currentCategoryId = id;
    globals.currentCategoryName = name;
    emit(ChangeCategoryState(id: id, name: name));
  }

  void getCategory() {
    int? id = globals.currentCategoryId;
    String? name = globals.currentCategoryName;
    emit(ChangeCategoryState(id: id,name: name));
  }
}
