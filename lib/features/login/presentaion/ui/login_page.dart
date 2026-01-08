import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // Controller auto inject from binding
  final LoginController controller = Get.find();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: const InputDecoration(labelText: 'Email')),
            const SizedBox(height: 12),
            TextField(controller: passwordController, obscureText: true, decoration: const InputDecoration(labelText: 'Password')),
            const SizedBox(height: 24),
            Obx(() => ElevatedButton(
              onPressed: controller.isLoading.value
                  ? null
                  : () {
                controller.login(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              child: controller.isLoading.value
                  ? const CircularProgressIndicator(color: Colors.white)
                  : const Text('Login'),
            )),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.user.value != null) {
                return Text('Welcome ${controller.user.value!.name}', style: const TextStyle(fontSize: 18));
              } else if (controller.error.isNotEmpty) {
                return Text(controller.error.value, style: const TextStyle(color: Colors.red));
              } else {
                return Container();
              }
            })
          ],
        ),
      ),
    );
  }
}
