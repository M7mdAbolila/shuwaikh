import 'package:bloc/bloc.dart';
import 'package:shuwaikh/core/helpers/user_info_cachce.dart';
import 'package:shuwaikh/features/account/data/repos/profile_repo.dart';
import 'package:shuwaikh/features/login/data/models/login_response.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(this._profileRepo) : super(ProfileState());
  final ProfileRepo _profileRepo;

  Future<void> getProfileData() async {
    emit(ProfileLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _profileRepo.getProfileData(token);
    result.fold(
      (failure) => emit(
        ProfileFailure(failure.errMessage),
      ),
      (user) => emit(
        ProfileSuccess(user),
      ),
    );
  }
}
