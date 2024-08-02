import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/shared_pref_helper.dart';

part 'username_state.dart';

class UsernameAndPhotoCubit extends Cubit<UsernameAndPhotoState> {
  UsernameAndPhotoCubit() : super(UsernameAndPhotoState());
  void getUsernameAndPhoto() async {
    final String? username =
        SharedPrefHelper.getSecuredString(SharedPrefKeys.username);
    final String? photo =
        SharedPrefHelper.getSecuredString(SharedPrefKeys.photo);
    emit(
      UsernameAndPhotoState(
        username: username,
        photo: photo,
      ),
    );
  }
}
