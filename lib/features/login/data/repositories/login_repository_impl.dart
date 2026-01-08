import '../../domain/entity/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../datasources/login_remote_datasource.dart';

// =============================
// Data Layer (Fake API)
// =============================

class LoginRepositoryImpl implements LoginRepository {
  final LoginRemoteDataSource remoteDataSource;


  LoginRepositoryImpl(this.remoteDataSource);


  @override
  Future<UserEntity> login(String email, String password) {
    return remoteDataSource.login(email, password);
  }
}