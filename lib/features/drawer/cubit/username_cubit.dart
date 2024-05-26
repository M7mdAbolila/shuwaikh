import 'package:bloc/bloc.dart';

import '../../../core/helpers/user_info_cachce.dart';

part 'username_state.dart';

class UsernameCubit extends Cubit<UsernameState> {
  UsernameCubit() : super(UsernameState(''));
  void getUsername() async {
    final userInfo = await UserInfoCachceHelper.getCachedUserInfo();
    final String? username = userInfo.username;
    emit(UsernameState(username!));
  }
}
