class AuthRemoteDataSource {
  Future<bool> login(String email, String password) async {
    await Future.delayed(Duration(seconds: 1)); // simulate network
    return email == "masumrna927@gmail.com" && password == "123455";
  }

  Future<void> logout() async {
    await Future.delayed(Duration(milliseconds: 500));
  }

  Future<bool> signup(String name, String email, String password) async {
    await Future.delayed(Duration(seconds: 1));
    return name == "masum" && email == "masumrna927@gmail.com" && password == "123455";
  }
}
