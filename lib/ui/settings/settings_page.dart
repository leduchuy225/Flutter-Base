import 'package:flutter/material.dart';
import 'package:flutter_base/extensions/future_extension.dart';
import 'package:get/get.dart';

import '../../data/pokemon_api.dart';

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
            await Get.find<PokemonApi>().getButterFreePokemon(
              apiParameters: ApiParameters(iShowError: true),
            );
            // print(data);
          },
        ),
      ),
    );
  }
}
