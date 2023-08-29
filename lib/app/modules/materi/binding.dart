import 'package:elearning/app/data/providers/materi_provider.dart';
import 'package:elearning/app/modules/materi/controller.dart';
import 'package:get/get.dart';

class MateriBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MateriProvider>(() => MateriProvider());
    Get.lazyPut<MateriController>(() => MateriController(materiProvider: Get.find()));
  }
}