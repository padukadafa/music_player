import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';

class PlaylistContainerView extends GetView<HomeController> {
  const PlaylistContainerView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: List.generate(3, (index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: colorScheme(context).primaryContainer,
                  ),
                ),
                SizedBox(
                  width: 130,
                  child: Text(
                    "Nama Playlist",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        color: colorScheme(context).onBackground),
                  ),
                ),
                Text(
                  "48 lagu",
                  style: GoogleFonts.lato(
                      fontSize: 12, color: colorScheme(context).onBackground),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
