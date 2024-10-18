import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/logout/data/repos/logout_repo.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._logoutRepo) : super(LogoutState());
  final LogoutRepo _logoutRepo;
  Future<void> logout() async {
    emit(LogoutLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _logoutRepo.logout(token);
    result.fold(
      (failure) => emit(
        LogoutFailure(errMessage: failure.errMessage),
      ),
      (success) => emit(
        LogoutSuccess(),
      ),
    );
  }
}
