import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:music_player/app/controllers/music_controller.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  final musicController = Get.find<MusicController>();
  final searchController = TextEditingController();
  final searchFocus = FocusNode();
  final searchText = "".obs;
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
    musicController.assetsAudioPlayer.dispose();
  }

  convertMSToMinute(int duration) {
    return "${duration ~/ 60000}:${((duration / 60000 - (duration ~/ 60000)) * 60).ceil()}";
  }

  List<SongModel> get songList {
    return musicController.songList.value
        .where((element) => element.title
            .toLowerCase()
            .contains(searchText.value.toLowerCase()))
        .toList();
  }

  void increment() => count.value++;
}
