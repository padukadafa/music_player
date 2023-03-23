import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_player/app/modules/music/controllers/music_controller.dart';

class MusicProgressView extends GetView<MusicPageController> {
  MusicProgressView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maxDuration = controller.musicController.assetsAudioPlayer.current
        .value!.audio.duration.inMicroseconds;
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(right: 20),
          margin: EdgeInsets.only(top: 20),
          alignment: Alignment.centerRight,
          child: StreamBuilder<Duration>(
              stream:
                  controller.musicController.assetsAudioPlayer.currentPosition,
              builder: (context, snapshot) {
                return Text(
                    "${controller.convertMSToMinute((snapshot.hasData) ? snapshot.data!.inMilliseconds : 0)}/${controller.convertMSToMinute((maxDuration / 1000).toInt())}");
              }),
        ),
        StreamBuilder<Duration>(
            stream:
                controller.musicController.assetsAudioPlayer.currentPosition,
            builder: (context, snapshot) {
              return Container(
                child: Slider.adaptive(
                    value: (((snapshot.data) ?? Duration.zero).inMicroseconds)
                        .toDouble(),
                    min: 0,
                    max: (maxDuration).toDouble(),
                    onChanged: (val) {
                      print(val);
                      controller.seekMusicTo(Duration(
                        microseconds: (val).toInt(),
                      ));
                    }),
              );
            }),
      ],
    );
  }
}
