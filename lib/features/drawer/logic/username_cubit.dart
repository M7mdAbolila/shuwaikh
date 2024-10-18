import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/constants.dart';
import 'package:shuwaikh/core/helpers/extensions.dart';
import 'package:shuwaikh/core/helpers/shared_pref_helper.dart';

part 'username_state.dart';

class UsernameAndPhotoCubit extends Cubit<UsernameAndPhotoState> {
  UsernameAndPhotoCubit() : super(UsernameAndPhotoState());
  Future<void> getUsernameAndPhoto() async {
    late String? username;
    final String? cahcedUsername =
        await SharedPrefHelper.getString(SharedPrefKeys.username);
    final String? cahcedFname =
        await SharedPrefHelper.getString(SharedPrefKeys.fname);
    if (cahcedUsername.isNullOrEmpty()) {
      username = cahcedFname;
    } else {
      username = cahcedUsername;
    }
    final String? photo =
        await SharedPrefHelper.getString(SharedPrefKeys.photo);
    emit(
      UsernameAndPhotoState(
        username: username,
        photo: photo,
      ),
    );
  }
}
