import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_recuirtment/data/repo/loginRepository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit(this._authRepository) : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());

    try {
      final response = await _authRepository.login(email, password);
      emit(LoginSuccess(response.token));
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
