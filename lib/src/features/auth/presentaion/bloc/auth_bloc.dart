// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../domain/usecases/login_usecase.dart';
// import '../../domain/usecases/logout_usecase.dart';
// import '../../domain/usecases/signup_usecase.dart';
//
// class AuthBloc extends Cubit<String> {
//   final LoginUseCase loginUseCase;
//   final LogoutUseCase logoutUseCase;
//   final SignupUseCase signupUseCase;
//
//   AuthBloc(this.loginUseCase, this.logoutUseCase, this.signupUseCase) : super("Initial");
//
//   Future<void> login(String email, String password) async {
//     emit("Loading...");
//     final success = await loginUseCase.call(email, password);
//     emit(success ? "Login Success" : "Login Failed");
//   }
//
//   Future<void> logout() async {
//     await logoutUseCase.call();
//     emit("Logged Out");
//   }
//
//   Future<void> signup(String name, String email, String password) async {
//     emit("Loading...");
//     final success = await signupUseCase.call(name, email, password);
//     emit(success ? "Signup Success" : "Signup Failed");
//   }
// }
