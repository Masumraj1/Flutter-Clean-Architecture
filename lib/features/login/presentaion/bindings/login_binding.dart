import 'package:get/get.dart';
import '../../data/datasources/login_remote_datasource.dart';
import '../../data/repositories/login_repository_impl.dart';
import '../../domain/usecases/login_usecase.dart';
import '../controller/login_controller.dart';


class LoginBinding extends Bindings {
  @override
  void dependencies() {
    // Data layer
    final remoteDataSource = LoginRemoteDataSourceImpl();
    final repository = LoginRepositoryImpl(remoteDataSource);
    final useCase = LoginUseCase(repository);

    // Controller lazy inject
    Get.lazyPut(() => LoginController(useCase), fenix: true);
  }
}
