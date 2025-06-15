import 'package:flutter/material.dart';
import 'package:flutter_base/core/extensions/future_extension.dart';
import 'package:flutter_base/models/file_collection_model.dart';
import 'package:flutter_base/widgets/checkbox/checkbox_controller.dart';
import 'package:flutter_base/widgets/checkbox/checkbox_widget.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_controller.dart';
import 'package:flutter_base/widgets/file_collection/file_collection_widget.dart';
import 'package:flutter_base/widgets/my_appbar.dart';
import 'package:get/get.dart';

import '../../data/pokemon/pokemon_api.dart';

class SettingsScreen extends StatefulWidget {
  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _checkboxController = MyCheckboxController();
  final _fileCollectionController = FileCollectionController();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((data) {
      _fileCollectionController.files.value = [
        FileCollectionModel(
          fileName: 'TEST',
          isLocal: false,
          filePath:
              'https://scontent-hkg4-1.cdninstagram.com/v/t51.2885-15/487388411_17931568908001354_4700066312498966483_n.jpg?stp=dst-jpg_e35_p1080x1080_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ&_nc_ht=scontent-hkg4-1.cdninstagram.com&_nc_cat=110&_nc_oc=Q6cZ2QH6bGTAuyUvxpShmn-UKEkpBNAFnL4HKdNKHFQtowwcfEnl696FpotfOmJMZ_uUWl_LAUkUAEmzbHMf9pT239w4&_nc_ohc=AsuBi1zs8sAQ7kNvwGmPMbH&_nc_gid=spzL3caOrM_n4E_92PoBgA&edm=AP4sbd4BAAAA&ccb=7-5&ig_cache_key=MzU5Nzg4ODA1MzU2Mzk3ODUyNg%3D%3D.3-ccb7-5&oh=00_AfMFJKBtYgxXjokQ5nN6B94TuAUOgPVSR7Ze5x4dibxA1w&oe=6854B735&_nc_sid=7a9f4b',
        ),
        FileCollectionModel(
          fileName: 'TEST',
          isLocal: false,
          filePath:
              'https://scontent-hkg4-1.cdninstagram.com/v/t51.2885-15/487388411_17931568908001354_4700066312498966483_n.jpg?stp=dst-jpg_e35_p1080x1080_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ&_nc_ht=scontent-hkg4-1.cdninstagram.com&_nc_cat=110&_nc_oc=Q6cZ2QH6bGTAuyUvxpShmn-UKEkpBNAFnL4HKdNKHFQtowwcfEnl696FpotfOmJMZ_uUWl_LAUkUAEmzbHMf9pT239w4&_nc_ohc=AsuBi1zs8sAQ7kNvwGmPMbH&_nc_gid=spzL3caOrM_n4E_92PoBgA&edm=AP4sbd4BAAAA&ccb=7-5&ig_cache_key=MzU5Nzg4ODA1MzU2Mzk3ODUyNg%3D%3D.3-ccb7-5&oh=00_AfMFJKBtYgxXjokQ5nN6B94TuAUOgPVSR7Ze5x4dibxA1w&oe=6854B735&_nc_sid=7a9f4b',
        ),
        FileCollectionModel(
          fileName: 'TEST',
          isLocal: false,
          filePath:
              'https://scontent-hkg4-1.cdninstagram.com/v/t51.2885-15/487388411_17931568908001354_4700066312498966483_n.jpg?stp=dst-jpg_e35_p1080x1080_tt6&efg=eyJ2ZW5jb2RlX3RhZyI6IkNBUk9VU0VMX0lURU0uaW1hZ2VfdXJsZ2VuLjE0NDB4MTgwMC5zZHIuZjc1NzYxLmRlZmF1bHRfaW1hZ2UifQ&_nc_ht=scontent-hkg4-1.cdninstagram.com&_nc_cat=110&_nc_oc=Q6cZ2QH6bGTAuyUvxpShmn-UKEkpBNAFnL4HKdNKHFQtowwcfEnl696FpotfOmJMZ_uUWl_LAUkUAEmzbHMf9pT239w4&_nc_ohc=AsuBi1zs8sAQ7kNvwGmPMbH&_nc_gid=spzL3caOrM_n4E_92PoBgA&edm=AP4sbd4BAAAA&ccb=7-5&ig_cache_key=MzU5Nzg4ODA1MzU2Mzk3ODUyNg%3D%3D.3-ccb7-5&oh=00_AfMFJKBtYgxXjokQ5nN6B94TuAUOgPVSR7Ze5x4dibxA1w&oe=6854B735&_nc_sid=7a9f4b',
        ),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar.appBar('Settings'),
      // backgroundColor: Colors.red[50],
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
                _checkboxController
                  ..isEnable.value = true
                  ..isSelected.value = false
                  ..title.value = 'Test checkbox done';

                // print(checkboxController.value);

                // MyDialog.alertDialog(checkboxController.value.toString());
              },
              child: const Icon(Icons.smart_button),
            ),
            const SizedBox(height: 16),
            MyCheckbox(
              isSelected: true,
              title: 'Test checkbox',
              onChanged: (value) {
                print('Hello world $value');
              },
              controller: _checkboxController,
            ),
            FileCollectionWidget(controller: _fileCollectionController),
          ],
        ),
      ),
    );
  }
}
