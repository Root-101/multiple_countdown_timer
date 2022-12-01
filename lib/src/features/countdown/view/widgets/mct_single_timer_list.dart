import 'package:flutter/material.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTSingleTimerList extends StatelessWidget {
  MCTTimerDomain timerDomain;

  MCTSingleTimerList({
    required this.timerDomain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text(
        timerDomain.remainingDuration.toString(),
      ),
    );
  }
}
