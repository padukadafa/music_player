import 'package:get/get.dart';
import 'package:music_player/app/controllers/music_controller.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final musicController = Get.find<MusicController>();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  convertMSToMinute(int duration) {
    return "${duration ~/ 60000}:${((duration / 60000 - (duration ~/ 60000)) * 60).ceil()}";
  }

  void increment() => count.value++;
}
