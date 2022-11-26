import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class Timer extends GetView<MCTTimerController> {
  static const ROUTE_NAME = "/mct-timer-screen";

  Duration duration;

  TextEditingController nameController = TextEditingController();

  Timer({Key? key, this.duration = const Duration()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
        ),
      ),
    );
  }
}
