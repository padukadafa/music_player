import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:music_player/app/modules/home/controllers/home_controller.dart';

class SearchView extends GetView<HomeController> {
  const SearchView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SearchView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SearchView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
