import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/login/data/datasources/login_remote_datasource.dart';
import 'features/login/data/repositories/login_repository_impl.dart';
import 'features/login/domain/usecases/login_usecase.dart';
import 'features/login/presentaion/controller/login_controller.dart';
import 'features/login/presentaion/ui/login_page.dart';

void main() {
  final remoteDataSource = LoginRemoteDataSourceImpl();
  final repository = LoginRepositoryImpl(remoteDataSource);
  final useCase = LoginUseCase(repository);
  final controller = LoginController(useCase);

  runApp(MyApp(controller: controller));
}

class MyApp extends StatelessWidget {
  final LoginController controller;

  const MyApp({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Login with GetX',
      home: LoginPage(controller: controller),
    );
  }
}
