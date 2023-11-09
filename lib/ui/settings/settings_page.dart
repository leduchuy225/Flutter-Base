import 'package:flutter/material.dart';
import 'package:flutter_base/extensions/future_extension.dart';
import 'package:flutter_base/widgets/checkbox/checkbox_controller.dart';
import 'package:flutter_base/widgets/checkbox/checkbox_widget.dart';
import 'package:get/get.dart';

import '../../data/pokemon/pokemon_api.dart';

class SettingsPage extends StatelessWidget {
  final checkboxController = MyCheckboxController();

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
                checkboxController
                  ..enable = true
                  ..value = false
                  ..title = 'Test checkbox done';

                // print(checkboxController.value);

                // MyDialog.alertDialog(checkboxController.value.toString());
              },
              child: const Icon(Icons.smart_button),
            ),
            const SizedBox(height: 16),
            MyCheckbox(
              value: true,
              title: 'Test checkbox',
              onChanged: (value) {
                print('Hello world $value');
              },
              controller: checkboxController,
            )
          ],
        ),
      ),
    );
  }
}
