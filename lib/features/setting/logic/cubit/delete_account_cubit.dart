import 'package:bloc/bloc.dart';

import 'package:shuwaikh/features/setting/data/repos/delete_account_repo.dart';

import '../../../../core/helpers/user_info_cachce.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final DeleteAccountRepo _deleteAccountRepo;
  DeleteAccountCubit(this._deleteAccountRepo) : super(DeleteAccountState());

  Future<void> deleteAcount() async {
    emit(DeleteAccountLoading());
    final String? token = await UserInfoCachceHelper.getCachedToken();
    var result = await _deleteAccountRepo.deleteAccount(token!);
    result.fold(
      (failure) {
        emit(DeleteAccountFailure(failure.errMessage));
      },
      (success) {
        emit(DeleteAccountSuccess(success));
      },
    );
  }
}
