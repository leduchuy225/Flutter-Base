import 'package:flutter/material.dart';
import 'package:flutter_base/extensions/future_extension.dart';
import 'package:flutter_base/widgets/dialog/dialog_widget.dart';
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: const Text('Settings Screen'),
              onTap: () async {
                await Get.find<PokemonApi>().getButterFreePokemon(
                  apiParameters: ApiParameters(iShowError: true),
                );
                // print(data);
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                MyDialog.dialog('AHIHI');
              },
              child: const Icon(Icons.smart_button),
            )
          ],
        ),
      ),
    );
  }
}
