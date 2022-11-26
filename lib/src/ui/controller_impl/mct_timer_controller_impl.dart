import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTTimerControllerImpl extends MCTTimerController {
  List<MCTTimerDomain> all = [
    MCTTimerDomain(
      name: 'Test 1',
      totalDuration: const Duration(
        seconds: 10,
      ),
    ),
    MCTTimerDomain(
      name: 'Test 2',
      totalDuration: const Duration(
        seconds: 5,
      ),
    ),
    MCTTimerDomain(
      name: 'Test 3',
      totalDuration: const Duration(
        seconds: 8,
      ),
    )
  ];

  @override
  List<MCTTimerDomain> findAll() {
    return all;
  }

  @override
  MCTTimerDomain create(String name, Duration duration) {
    MCTTimerDomain timer = MCTTimerDomain(
      totalDuration: duration,
      name: name,
    );
    all.add(timer);
    print('total: ${timer.totalDuration}, remaining: ${timer.remainingDuration}');
    update();
    return timer;
  }
}
