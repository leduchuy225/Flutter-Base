import 'package:flutter/material.dart';

class MyBottomSheet {
  void showDraggableScrollableSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isDismissible: true,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          key: UniqueKey(),
          initialChildSize: 0.7,
          maxChildSize: 0.9,
          minChildSize: .5,
          builder: (context, controller) => Column(
            children: [
              Container(
                height: 60,
                color: Colors.cyanAccent,
              ),
              Expanded(
                child: ListView(
                  controller: controller,
                  children: [
                    ...List.generate(
                      40,
                      (index) => Container(
                        height: 100,
                        color: index.isEven ? Colors.deepOrange : Colors.deepPurple,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
