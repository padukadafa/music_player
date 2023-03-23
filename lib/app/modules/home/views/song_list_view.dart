import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongListView extends GetView<HomeController> {
  const SongListView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SongModel>>(
        future: controller.musicController.getMusicList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.data != null) {
            return Obx(() {
              final songList = controller.songList;
              return Column(
                children: List.generate(songList.length, (index) {
                  return ListTile(
                    onTap: () async {
                      await controller.musicController
                          .playSong(songList[index]);
                      Get.toNamed(Routes.MUSIC);
                    },
                    leading: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: colorScheme(context).primaryContainer,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.music,
                        color: colorScheme(context).onPrimaryContainer,
                      ),
                    ),
                    title: Text(
                      "${songList[index].title}",
                      style: GoogleFonts.lato(
                        fontSize: 12,
                      ),
                    ),
                    subtitle: Text(
                        "${controller.convertMSToMinute(songList[index].duration ?? 0)}"),
                    trailing: StreamBuilder<bool>(
                        stream: controller
                            .musicController.assetsAudioPlayer.isPlaying,
                        builder: (context, snapshot) {
                          return IconButton(
                              onPressed: () {
                                if (controller.musicController.currentSongUri !=
                                    songList[index].uri) {
                                  controller.musicController
                                      .playSong(songList[index]);
                                }
                                if (snapshot.data ?? false) {
                                  controller.musicController.pauseSong();
                                } else {
                                  controller.musicController
                                      .playSong(songList[index]);
                                }
                              },
                              icon: ((snapshot.data ?? false) &&
                                      controller
                                              .musicController.currentSongUri ==
                                          songList[index].uri)
                                  ? FaIcon(FontAwesomeIcons.pause)
                                  : FaIcon(FontAwesomeIcons.play));
                        }),
                  );
                }),
              );
            });
          }
          return Text("Getting song...");
        });
  }
}
