import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicController extends GetxController {
  //TODO: Implement MusicController

  final OnAudioQuery _audioQuery = OnAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();
  final player = AudioPlayer();
  final count = 0.obs;
  Rx<List<SongModel>> songList = Rx([]);
  Rx<String?> currentSongUri = "".obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    songList.value = await getMusicList();
    songList.refresh();
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    player.dispose();
  }

  Future<List<SongModel>> getMusicList() async {
    // List<Directory>? _externalStorageDirectories =
    //     await getExternalStorageDirectories(type: StorageDirectory.music);
    // print(_externalStorageDirectories);
    if (!await _audioQuery.permissionsStatus()) {
      try {
        final _permissionStatus = await _audioQuery.permissionsRequest();
      } catch (e) {
        print(e);
      }
    }
    try {
      List<SongModel> songs =
          await _audioQuery.querySongs(uriType: UriType.EXTERNAL);
      print(songs.length);
      songList.value = songs;
      update();
      return songs;
    } on PlatformException {
      return [];
    }
  }

  pauseSong() async {
    await assetsAudioPlayer.pause();
    print(assetsAudioPlayer.currentPosition.value);
  }

  Future<void> playSong(SongModel song) async {
    if (song.uri != null) {
      await player.play(DeviceFileSource(song.data));
      currentSongUri.value = song.data;
      player.onPlayerComplete.listen((event) {
        currentSongUri.value = "";
      });
    }
  }
}
