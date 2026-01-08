# flutter_clean_architect



* Data layer

  * datasource's ===
  * models       ===
  * repositories === Repository Implementation (body implementation)

* Domain layer

  * entities     ===
  * repositories === Abstract Repository (no body implementation)
  * use cases    ===
  

* Presentation layer === ui+component
     





====domain --user entity --repository--use case ====
====data   --model ---datasource ----LoginRepositoryImpl


button press(ui) -------login method call(controller)-------loginUseCase  ------LoginRepository ---UserEntity--

================================LoginRepository--
1️⃣ Controller থেকে শুরু
* UI থেকে button press হলে Controller.login() call হয়
* Controller জানে “LoginUseCase দিয়ে login করো”
* Controller কখনো Repository বা DataSource কে call করে না

2️⃣ UseCase
* Controller → UseCase
* UseCase আসলে business rule রাখে
* এখানে Login business rule = “repository ব্যবহার করে login করো”
* UseCase logic:
* Controller কে data return করবে
* Controller কে data source / API details জানানো হবে না

3️⃣ Repository (LoginRepository / Impl)
* Repository হলো Data layer এর abstraction
* UseCase জানে “Login করতে হলে repository.call() করো”, কিন্তু data কোথা থেকে আসছে সেটা জানে না
* Repository নিজের মধ্যে decide করে:
* remote / local / cache / database → কোথা থেকে data আনবে
* এখন fake API ব্যবহার হচ্ছে, পরে real API replace করা যাবে কোন UI বা UseCase change ছাড়া

4️⃣ RemoteDataSource
* Repository → RemoteDataSource
* RemoteDataSource ঠিক করে “API call বা fake response”
* Data return করে UserModel আকারে

5️⃣ Model vs Entity
* UserEntity → Domain layer (Business layer)
* UserModel → Data layer (API / JSON conversion)
* Repository নিশ্চিত করে, UI বা UseCase কখনো Model দেখবে না, শুধু UserEntity দেখবে

1️⃣ UI → Button press
2️⃣ Controller.login() → call useCase
3️⃣ UseCase → repository.login()
4️⃣ Repository → remoteDataSource.login()
5️⃣ RemoteDataSource → fake API / network call
6️⃣ Response = UserModel → Repository → UserEntity → UseCase → Controller → UI