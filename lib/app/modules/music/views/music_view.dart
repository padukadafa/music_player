import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/music/views/music_button_view.dart';
import 'package:music_player/app/modules/music/views/music_progress_view.dart';
import 'package:music_player/app/modules/music/views/song_card_view.dart';

import '../controllers/music_controller.dart';

class MusicView extends GetView<MusicPageController> {
  const MusicView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: colorScheme(context).background,
        appBar: AppBar(
          title: Text(
            controller.musicController.assetsAudioPlayer.getCurrentAudioTitle,
            style: GoogleFonts.lato(
              fontSize: 16,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SongCardView(),
                MusicProgressView(),
                MusicButtonView(),
              ],
            ),
          ),
        ));
  }
}
