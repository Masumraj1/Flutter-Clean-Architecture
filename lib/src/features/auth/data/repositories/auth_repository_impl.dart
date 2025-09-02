import 'package:flutter/material.dart';
import 'package:flutter_clean_architect/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepoImplementation implements AuthRepository {

  @override
  Future<bool> login(String email, String password)  async {
    return email == "masumrna927@gmail.com" && password == "123455";
  }

  @override
  Future<void> logout() async {
    debugPrint("user logout successfully complete");
  }

  @override
  Future<bool> signup(String name, String email, String password)async {
   return name == "masum" && email == "masumrna927@gmail.com" && password == "123456";
  }

}