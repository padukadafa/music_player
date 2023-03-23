import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/home/views/playlist_container_view.dart';
import 'package:music_player/app/modules/home/views/search_view.dart';
import 'package:music_player/app/modules/home/views/song_list_view.dart';
import 'package:music_player/app/modules/home/views/title_view.dart';

import '../controllers/home_controller.dart';
import 'current_playing_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () {
          controller.searchFocus.unfocus();
        },
        child: Scaffold(
            backgroundColor: colorScheme(context).background,
            body: Center(
                child: Column(
              children: [
                TitleView(),
                // Container(
                //   margin: EdgeInsets.all(8),
                //   alignment: Alignment.centerLeft,
                //   child: Text(
                //     "Playlist",
                //     style: GoogleFonts.lato(
                //       fontWeight: FontWeight.w600,
                //       fontSize: 16,
                //       color: colorScheme(context).onBackground,
                //     ),
                //   ),
                // ),
                // PlaylistContainerView(),
                SearchView(),
                Container(
                  margin: const EdgeInsets.all(8),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Daftar Lagu",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: colorScheme(context).onBackground,
                    ),
                  ),
                ),
                Expanded(child: SingleChildScrollView(child: SongListView())),
                CurrentPlayingView(),
              ],
            ))),
      ),
    );
  }
}
