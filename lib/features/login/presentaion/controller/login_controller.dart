import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architect/features/login/domain/usecases/login_usecase.dart' show LoginUseCase;


class LoginController {
  final LoginUseCase loginUseCase;


  LoginController(this.loginUseCase);

//=============Login Method==========
  Future<void> login(email,password) async {
    final user = await loginUseCase(email, password);
    debugPrint("UserName=====>>${user.name},UserEmail========>>${user.email}, UserId=======>>${user.id}");

  }
}