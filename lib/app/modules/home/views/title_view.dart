import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';

class TitleView extends GetView {
  const TitleView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      child: Text(
        "Music Player",
        style: GoogleFonts.lato(
          fontWeight: FontWeight.w600,
          fontSize: 21,
          color: colorScheme(context).primary,
        ),
      ),
    );
  }
}
