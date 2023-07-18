import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/pokemon_api.dart';
import '../../helper/dialog_utils.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: InkWell(
          child: const Text('Settings Screen'),
          onTap: () async {
            final data = await Get.find<PokemonApi>().getPokemonsList();
            print('Pokemon List $data');
            DialogUtility.dialog('Testing Dialog');
          },
        ),
      ),
    );
  }
}
