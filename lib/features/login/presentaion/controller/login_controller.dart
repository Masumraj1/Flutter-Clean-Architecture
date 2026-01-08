import 'package:flutter_riverpod/legacy.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/entity/user_entity.dart';

class LoginState {
  final bool isLoading;
  final UserEntity? user;
  final String? error;

  LoginState({this.isLoading = false, this.user, this.error});
}

class LoginController extends StateNotifier<LoginState> {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase) : super(LoginState());

  Future<void> login(String email, String password) async {
    try {
      state = LoginState(isLoading: true);
      final user = await loginUseCase(email, password);
      state = LoginState(user: user);
    } catch (e) {
      state = LoginState(error: e.toString());
    }
  }
}
