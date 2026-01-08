import '../model/user_model.dart';

abstract class LoginRemoteDataSource {
  Future<UserModel> login(String email, String password);
}


class LoginRemoteDataSourceImpl implements LoginRemoteDataSource {
  @override
  Future<UserModel> login(String email, String password) async {
// fake API response
    await Future.delayed(Duration(seconds: 1));


    return UserModel.fromJson({
      'id': 1,
      'name': 'Masum',
      'email': email,
    });
  }
}