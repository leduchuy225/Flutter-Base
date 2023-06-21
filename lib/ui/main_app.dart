import 'package:flutter/material.dart';
import 'package:flutter_base/data/api_locator.dart';
import 'package:flutter_base/data/pokemon_api.dart';
import 'package:flutter_base/services/service_locator.dart';
import 'package:get/get.dart';

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  void initState() {
    super.initState();

    setupServiceLocator();

    setupApiLocator();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        body: Center(
          child: InkWell(
            child: const Text('Hello World!'),
            onTap: () async {
              final data = await Get.find<PokemonApi>().getPokemonsList();
              print('Data $data');
            },
          ),
        ),
      ),
    );
  }
}
