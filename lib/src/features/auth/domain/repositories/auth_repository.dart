abstract class AuthRepository {
  Future<bool> signup(String name , String email , String password);
  Future<bool> login(String email, String password);

  Future<void> logout();

}