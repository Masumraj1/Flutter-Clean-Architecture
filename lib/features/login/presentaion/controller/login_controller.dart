import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../domain/usecases/login_usecase.dart';
import '../../domain/entity/user_entity.dart';

class LoginController extends GetxController {
  final LoginUseCase loginUseCase;

  LoginController(this.loginUseCase);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // Reactive variables
  var isLoading = false.obs;
  var user = Rxn<UserEntity>();
  var error = ''.obs;

  // Login method
  Future<void> login({required String email, required String password}) async {
    try {
      isLoading.value = true;
      error.value = '';
      final result = await loginUseCase(email, password);
      user.value = result;
    } catch (e) {
      error.value = 'Login failed: $e';
    } finally {
      isLoading.value = false;
    }
  }
}
