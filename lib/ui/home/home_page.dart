import 'package:flutter/material.dart';
import 'package:flutter_base/models/base_selector.dart';
import 'package:flutter_base/routers/main_router.dart';
import 'package:flutter_base/widgets/drawer/scaffold_drawer_widget.dart';
import 'package:flutter_base/widgets/selector/selector_controller.dart';
import 'package:get/get.dart';

import '../../widgets/dialog/dialog_widget.dart';
import '../../widgets/search_field/search_field_widget.dart';
import '../../widgets/selector/bottomsheet_selector/bottomsheet_selector_widget.dart';
import '../../widgets/selector/dropdown_selector/dropdown_selector_widget.dart';
import '../../widgets/text_field/text_field_controller.dart';
import '../../widgets/text_field/text_field_widget.dart';

class HomePage extends StatelessWidget {
  final mySelectorController = MySelectorController();
  final textInputController = TextEditingController();
  final myTextInputController = MyTextFieldController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: InheritedDrawer.of(context)?.scaffoldKey,
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            tooltip: 'Open shopping cart',
            onPressed: () {
              Get.toNamed(MainRouter.COUNTER);
            },
          ),
          IconButton(
            icon: const Icon(Icons.theater_comedy),
            tooltip: 'Change theme',
            onPressed: () {
              Get.changeTheme(Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
            },
          ),
          IconButton(
            icon: const Icon(Icons.draw),
            tooltip: 'Open drawer',
            onPressed: () {
              InheritedDrawer.of(context)?.openDrawer();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              child: const Text('Home Screen'),
              onTap: () async {
                // try {
                //   await Get.find<PokemonApi>().getPokemonFail();
                // } catch (error) {
                //   print('tryCatch ${error.toString()}');
                // }
                myTextInputController.text = 'Tran Thanh Loan';
                myTextInputController.enable = !myTextInputController.enable;
                mySelectorController.selectors = [MySelectorModel(id: 'HomeScreen', name: 'HomeScreen')];
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: textInputController,
              decoration: const InputDecoration(
                labelText: 'Enter the Value',
                errorText: "Value Can't Be Empty \nValue Can't Be Short too",
              ),
            ),
            MyTextField(
              labelText: 'My Text Field',
              controller: myTextInputController,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // myTextInputController.shake(errorTexts: ['123', '456']);
                MyDialog.snackbar('Giac mo trua', title: 'Thuy chi');

                print(mySelectorController.first?.id);
                print(mySelectorController.first?.name);
              },
              child: const Text('Hello world'),
            ),
            const SizedBox(height: 16),
            MyDropdownSelector(),
            const SizedBox(height: 16),
            MySearchField(
              onFiltered: (text) {
                print(text);
              },
            ),
            const SizedBox(height: 16),
            MyBottomsheetSelector(
              controller: mySelectorController,
              getStaticData: () {
                return [
                  MySelectorModel(id: '1', name: 'Huy'),
                  MySelectorModel(id: '2', name: 'Loan'),
                ];
              },
            ),
            const SizedBox(height: 50),
            const Text('I love you more than i can say'),
          ],
        ),
      ),
    );
  }
}
