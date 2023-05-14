import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:get/get.dart';
import 'package:music_player/app/modules/music/controllers/music_controller.dart';

import '../../../helpers/colors/color_schemes.dart';

class MusicButtonView extends GetView<MusicPageController> {
  const MusicButtonView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.repeat,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.arrowLeft,
            size: 24,
          ),
        ),
        Container(
          padding: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: colorScheme(context).primaryContainer,
            shape: BoxShape.circle,
          ),
          // child: StreamBuilder<bool>(
          //   stream: controller.musicController.assetsAudioPlayer.isPlaying,
          //   builder: (context, snapshot) {
          //     return IconButton(
          //       onPressed: () {
          //         if (snapshot.data ?? false) {
          //           controller.musicController.pauseSong();
          //         } else {
          //           controller.musicController.playSong(null);
          //         }
          //       },
          //       icon: (snapshot.data ?? false)
          //           ? FaIcon(
          //               FontAwesomeIcons.pause,
          //               size: 36,
          //             )
          //           : FaIcon(
          //               FontAwesomeIcons.play,
          //               size: 36,
          //             ),
          //     );
          //   },
          // ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.arrowRight,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: FaIcon(
            FontAwesomeIcons.shuffle,
            size: 24,
          ),
        ),
      ],
    );
  }
}
