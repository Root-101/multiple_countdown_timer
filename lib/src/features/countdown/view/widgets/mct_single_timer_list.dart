import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTSingleTimerList extends StatelessWidget {
  MCTTimerDomain timerDomain;
  CountDownController controller = CountDownController();

  MCTSingleTimerList({
    required this.timerDomain,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          CircularCountDownTimer(
            duration: timerDomain.remainingDuration.inSeconds,
            initialDuration: 0,
            controller: controller,
            width: 50,
            height: 50,
            ringColor: Colors.grey[300]!,
            fillColor: Colors.purpleAccent[100]!,
            backgroundColor: Colors.purple[500],
            strokeWidth: 10.0,
            strokeCap: StrokeCap.round,
            textStyle: const TextStyle(
                fontSize: 10.0,
                color: Colors.white,
                fontWeight: FontWeight.bold),
            textFormat: CountdownTextFormat.HH_MM_SS,
            isReverse: true,
            isReverseAnimation: true,
            isTimerTextShown: true,
            autoStart: true,
            onStart: () {
              debugPrint('Countdown Started');
            },
            onComplete: () {
              debugPrint('Countdown Ended');
            },
            onChange: (String timeStamp) {
              debugPrint('Countdown Changed $timeStamp');
            },
            timeFormatterFunction: (defaultFormatterFunction, duration) {
              if (duration.inSeconds == 0) {
                return "Start";
              } else {
                return Function.apply(defaultFormatterFunction, [duration]);
              }
            },
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            timerDomain.remainingDuration.toString(),
          )
        ],
      ),
    );
  }
}
