import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTCreateButton extends StatelessWidget {
  const MCTCreateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(
        Icons.add,
      ),
      onPressed: () {
        Get.toNamed(Timer.ROUTE_NAME);
      },
    );
  }
}
