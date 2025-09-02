// import 'package:flutter/material.dart';
// import '../bloc/auth_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class LoginPage extends StatelessWidget {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     final authBloc = context.read<AuthBloc>();
//
//     return Scaffold(
//       appBar: AppBar(title: Text("Login")),
//       body: Column(
//         children: [
//           TextField(controller: emailController, decoration: InputDecoration(labelText: "Email")),
//           TextField(controller: passwordController, decoration: InputDecoration(labelText: "Password")),
//           ElevatedButton(
//             onPressed: () => authBloc.login(emailController.text, passwordController.text),
//             child: Text("Login"),
//           ),
//           BlocBuilder<AuthBloc, String>(
//             builder: (context, state) => Text(state),
//           ),
//         ],
//       ),
//     );
//   }
// }
