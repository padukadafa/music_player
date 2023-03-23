import 'dart:io';

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/services.dart';
import 'package:flutter_storage_path/flutter_storage_path.dart';
import 'package:get/get.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicController extends GetxController {
  //TODO: Implement MusicController

  final OnAudioQuery _audioQuery = OnAudioQuery();
  final assetsAudioPlayer = AssetsAudioPlayer();
  final count = 0.obs;
  String? currentSongUri;
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
      return songs;
    } on PlatformException {
      return [];
    }
  }

  pauseSong() async {
    await assetsAudioPlayer.pause();
    print(assetsAudioPlayer.currentPosition.value);
  }

  playSong(SongModel? song) async {
    if (song != null && currentSongUri != song.uri) {
      currentSongUri = song.uri;
      await assetsAudioPlayer.open(
        Audio.file(song.uri ?? "",
            metas: Metas(
                title: song.title,
                album: song.album,
                artist: song.artist,
                id: song.id.toString())),
        showNotification: true,
      );
    }

    await assetsAudioPlayer.play();
  }
}
