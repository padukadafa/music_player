import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';
import 'package:music_player/app/routes/app_pages.dart';

class CurrentPlayingView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<AudioEvent?>(
      stream: controller.musicController.player.eventStream,
      builder: (context, snapshot) {
        if ((snapshot.data != null)) {
          return Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(width: 2, color: Colors.grey))),
            child: ListTile(
              onTap: () => Get.toNamed(Routes.MUSIC),
              title: Text(
                "",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: StreamBuilder<Duration>(
                  stream: controller
                      .musicController.assetsAudioPlayer.currentPosition,
                  builder: (context, snapshot) {
                    return Text(
                        "${controller.convertMSToMinute((snapshot.hasData) ? snapshot.data!.inMilliseconds : 0)}/${controller.convertMSToMinute(controller.musicController.assetsAudioPlayer.current.value!.audio.duration.inMilliseconds)}");
                  }),
              trailing: StreamBuilder<bool>(
                  stream:
                      controller.musicController.assetsAudioPlayer.isPlaying,
                  builder: (context, snapshot) {
                    return IconButton(
                        onPressed: () {
                          if (snapshot.data ?? false) {
                            controller.musicController.pauseSong();
                          } else {
                            // controller.musicController.playSong(null);
                          }
                        },
                        icon: (snapshot.data ?? false)
                            ? FaIcon(FontAwesomeIcons.pause)
                            : FaIcon(FontAwesomeIcons.play));
                  }),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
