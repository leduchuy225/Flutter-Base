// import 'package:flutter/material.dart';
// import 'package:flutter_base/core/extensions/future_extension.dart';
// import 'package:flutter_base/models/file_collection_model.dart';
// import 'package:flutter_base/widgets/checkbox/checkbox_controller.dart';
// import 'package:flutter_base/widgets/checkbox/checkbox_widget.dart';
// import 'package:flutter_base/widgets/file_collection/file_collection_controller.dart';
// import 'package:flutter_base/widgets/file_collection/file_collection_widget.dart';
// import 'package:flutter_base/widgets/my_appbar.dart';
// import 'package:get/get.dart';

// import '../../data/pokemon/pokemon_api.dart';

// class SettingsScreen extends StatefulWidget {
//   @override
//   State<SettingsScreen> createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   final _checkboxController = MyCheckboxController();
//   final _fileCollectionController = FileCollectionController();

//   @override
//   void initState() {
//     super.initState();

//     WidgetsBinding.instance.addPostFrameCallback((data) {
//       _fileCollectionController.files.value = [
//         const FileCollectionModel(
//           fileName: 'TEST',
//           isLocal: false,
//           filePath:
//               'https://bowseat.org/wp-content/uploads/2023/07/chihiro045.jpeg',
//         ),
//       ];
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppbar.appBar('Settings'),
//       // backgroundColor: Colors.red[50],
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             InkWell(
//               child: const Text('Settings Screen'),
//               onTap: () async {
//                 await Get.find<PokemonApi>().getButterFreePokemon(
//                   apiParameters: ApiParameters(isShowMessage: true),
//                 );
//                 // print(data);
//               },
//             ),
//             const SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 _checkboxController
//                   ..isEnable.value = true
//                   ..isSelected.value = false
//                   ..title.value = 'Test checkbox done';

//                 // print(checkboxController.value);

//                 // MyDialog.alertDialog(checkboxController.value.toString());
//               },
//               child: const Icon(Icons.smart_button),
//             ),
//             const SizedBox(height: 16),
//             MyCheckbox(
//               isSelected: true,
//               title: 'Test checkbox',
//               onChanged: (value) {
//                 print('Hello world $value');
//               },
//               controller: _checkboxController,
//             ),
//             FileCollectionWidget(controller: _fileCollectionController),
//           ],
//         ),
//       ),
//     );
//   }
// }
