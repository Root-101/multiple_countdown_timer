import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTMainBody extends GetView<MCTTimerController> {
  const MCTMainBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MCTTimerController>(
      builder: (_) {
        return Column(
          children: controller
              .findAll()
              .map(
                (e) => ListTile(
                  title: Text(e.name),
                  subtitle: Text(e.remainingDuration.toString()),
                ),
              )
              .toList(),
        );
      }
    );
  }
}
