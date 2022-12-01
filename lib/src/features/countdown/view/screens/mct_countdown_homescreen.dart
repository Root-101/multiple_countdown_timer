import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTCountDownHomeScreen extends GetView<MCTCountdownController> {
  static const String ROUTE_NAME = "/mct-countdown-homescreen";

  const MCTCountDownHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          MCTAppBar(title: 'Timers home screen'),
          GetBuilder<MCTCountdownController>(
            builder: (_) {
              return SliverList(
                delegate: SliverChildListDelegate.fixed(
                  controller
                      .findAll()
                      .map(
                        (timerDomain) => MCTSingleTimerList(
                          timerDomain: timerDomain,
                        ),
                      )
                      .toList(),
                ),
              );
            }
          ),
        ],
      ),
      floatingActionButton: MCTCountdownCreateButton(),
    );
  }
}
