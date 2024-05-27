import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'username_state.dart';

class UsernameAndPhotoCubit extends Cubit<UsernameAndPhotoState> {
  UsernameAndPhotoCubit() : super(UsernameAndPhotoState());
  void getUsernameAndPhoto() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final String? username = sharedPreferences.getString('username');
    final String? photo = sharedPreferences.getString('photo');
    emit(
      UsernameAndPhotoState(
        username: username,
        photo: photo,
      ),
    );
  }
}
