import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/pokemon_api.dart';
import '../../extensions/future_extension.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: InkWell(
          child: const Text('Home Screen'),
          onTap: () async {
            try {
              await Get.find<PokemonApi>().getPokemonFail();
            } catch (error) {
              print('tryCatch ${error.toString()}');
            }
          },
        ),
      ),
    );
  }
}
