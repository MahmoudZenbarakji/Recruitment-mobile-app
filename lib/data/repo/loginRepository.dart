import '../api/authService.dart';
import '../model/login.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<LoginResponse> login(String email, String password) {
    return _authService.login(email, password);
  }
}
