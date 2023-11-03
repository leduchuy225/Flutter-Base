import 'package:flutter/material.dart';
import 'package:flutter_base/routers/main_router.dart';
import 'package:flutter_base/widgets/drawer/scaffold_drawer_widget.dart';
import 'package:get/get.dart';

import '../../data/pokemon_api.dart';

class HomePage extends StatelessWidget {
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
