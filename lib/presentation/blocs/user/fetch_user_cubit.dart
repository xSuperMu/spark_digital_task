import 'package:spark_digital/imports.dart';

part 'fetch_user_state.dart';

class FetchUserCubit extends Cubit<FetchUserState> {
  final FetchUserUseCase _fetchUserUseCase;

  FetchUserCubit(this._fetchUserUseCase) : super(FetchUserInitial());

  void fetchUserData() async {
    emit(FetchUserLoading());

    final result = await _fetchUserUseCase(params: unit);

    result.fold((failure) {
      emit(FetchUserFailure(failure: failure));
    }, (result) {
      emit(FetchUserSuccess(userEntity: result));
    });
  }
}
