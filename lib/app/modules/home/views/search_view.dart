import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_player/app/helpers/colors/color_schemes.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      decoration: BoxDecoration(
        color: colorScheme(context).primaryContainer,
        borderRadius: BorderRadius.circular(12),
        // border: Border.all()
      ),
      child: TextField(
        controller: controller.searchController,
        focusNode: controller.searchFocus,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: EdgeInsets.only(left: 10),
            hintText: "Cari Musik",
            hintStyle: GoogleFonts.lato(
              color: colorScheme(context).onPrimaryContainer,
            )),
        onChanged: (val) {
          controller.searchText.value = val;
        },
      ),
    );
  }
}
