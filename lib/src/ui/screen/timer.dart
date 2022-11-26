import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class Timer extends StatelessWidget {
  static void showInModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
      ),
      backgroundColor: Colors.white,
      useRootNavigator: true,
      context: context,
      builder: (context) => Timer(),
    );
  }

  Duration duration;

  TextEditingController nameController = TextEditingController();

  Timer({Key? key, this.duration = const Duration()}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                  //setState(() => duration = newDuration);
                },
              ),
              TextField(
                controller: nameController,
              ),
              ElevatedButton(
                onPressed: () {
                  print('Crear timer ${duration.inSeconds}');
                  Get.back();
                },
                child: const Text("Crear timer"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
