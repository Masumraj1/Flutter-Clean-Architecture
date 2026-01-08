import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/login/presentaion/ui/login_page.dart';
import 'features/login/presentaion/bindings/login_binding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clean Login with GetX',
      initialRoute: '/login',
      getPages: [
        GetPage(
          name: '/login',
          page: () => LoginPage(),
          binding: LoginBinding(), // ← binding attach
        ),
      ],
    );
  }
}
