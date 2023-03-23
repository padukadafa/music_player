import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/music_controller.dart';

class MusicPageController extends GetxController {
  //TODO: Implement MusicController

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

  Future<void> seekMusicTo(Duration duration) async {
    await musicController.assetsAudioPlayer.seek(duration);
  }

  convertMSToMinute(int duration) {
    return "${duration ~/ 60000}:${((duration / 60000 - (duration ~/ 60000)) * 60).ceil()}";
  }

  void increment() => count.value++;
}
