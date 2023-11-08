import 'package:flutter/material.dart';
import 'package:flutter_base/widgets/loading/loading_widget.dart';
import 'package:get/get.dart';

import '../../widgets/drawer/scaffold_drawer_widget.dart';
import 'counter_page_state.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CounterPageState>();

    return DrawerScaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // MyLoading(),
            const Text(
              'You have pushed the button this many times:',
            ),
            Obx(
              () => Text(
                controller.count.toString(),
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      onPressed: () {
                        InheritedDrawer.of(context)?.openDrawer();
                      },
                      child: const Icon(Icons.remove),
                    );
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.circle),
                  onPressed: () {
                    MyLoading.show();
                    Future.delayed(const Duration(seconds: 3)).then((value) {
                      MyLoading.hide();
                    });
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.add),
                  onPressed: controller.increment,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
