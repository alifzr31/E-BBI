import 'package:elearning/app/data/providers/auth_provider.dart';
import 'package:elearning/app/modules/auth/controller.dart';
import 'package:get/get.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthProvider>(() => AuthProvider());
    Get.lazyPut<AuthController>(() => AuthController(authProvider: Get.find()));
  }
}
