import 'package:flutter_clean_architect/features/login/data/datasources/login_remote_datasource.dart';
import 'package:flutter_clean_architect/features/login/data/repositories/login_repository_impl.dart';
import 'package:flutter_clean_architect/features/login/domain/repositories/login_repository.dart';
import 'package:flutter_clean_architect/features/login/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

import '../controller/login_controller.dart';

// DataSource provider
final loginRemoteDataSourceProvider = Provider<LoginRemoteDataSource>(
      (ref) => LoginRemoteDataSourceImpl(),
);

// Repository provider
final loginRepositoryProvider = Provider<LoginRepository>(
      (ref) => LoginRepositoryImpl(ref.watch(loginRemoteDataSourceProvider)),
);

// UseCase provider
final loginUseCaseProvider = Provider<LoginUseCase>(
      (ref) => LoginUseCase(ref.watch(loginRepositoryProvider)),
);

// Controller provider
final loginControllerProvider =
StateNotifierProvider<LoginController, LoginState>(
      (ref) => LoginController(ref.watch(loginUseCaseProvider)),
);
