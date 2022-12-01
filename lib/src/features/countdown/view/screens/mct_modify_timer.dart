import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTModifyTimer extends GetView<MCTCountdownController> {
  static const String ROUTE_NAME = "/mct-modify-timer";

  Duration duration = const Duration();
  TextEditingController nameController = TextEditingController();

  MCTModifyTimer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create/Edit Timer',
        ),
      ),
      body: Container(
        child: Column(
          children: [
            CupertinoTimerPicker(
              initialTimerDuration: duration,
              onTimerDurationChanged: (newDuration) {
                duration = newDuration;
                print(duration.toString());
              },
            ),
            TextField(
              controller: nameController,
            ),
            ElevatedButton(
              onPressed: () {
                controller.create(
                  nameController.text,
                  duration,
                );
                Get.back();
              },
              child: const Text("Crear timer"),
            ),
          ],
        ),
      ),
    );
  }
}
