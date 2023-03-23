import 'dart:io';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
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
            final data = snapshot.data ?? [];
            return Column(
              children: List.generate(data.length, (index) {
                return ListTile(
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
                    "${data[index].title}",
                    style: GoogleFonts.lato(
                      fontSize: 12,
                    ),
                  ),
                  subtitle: Text(
                      "${controller.convertMSToMinute(data[index].duration ?? 0)}"),
                  trailing: StreamBuilder<bool>(
                      stream: controller
                          .musicController.assetsAudioPlayer.isPlaying,
                      builder: (context, snapshot) {
                        return IconButton(
                            onPressed: () {
                              if (controller.musicController.currentSongUri !=
                                  data[index].uri) {
                                controller.musicController
                                    .playSong(data[index]);
                              }
                              if (snapshot.data ?? false) {
                                controller.musicController.pauseSong();
                              } else {
                                controller.musicController
                                    .playSong(data[index]);
                              }
                            },
                            icon: ((snapshot.data ?? false) &&
                                    controller.musicController.currentSongUri ==
                                        data[index].uri)
                                ? FaIcon(FontAwesomeIcons.pause)
                                : FaIcon(FontAwesomeIcons.play));
                      }),
                );
              }),
            );
          }
          return Text("Loading...");
        });
  }
}
