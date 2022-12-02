import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTCountdownControllerImpl extends MCTCountdownController {
  List<MCTTimerDomain> all = [
    MCTTimerDomain.buildNew(
      name: 'Test 1',
      initialTotalDuration: const Duration(
        seconds: 10,
      ),
      state: MCTTimerState.play,
    ),
    MCTTimerDomain.buildNew(
      name: 'Test 2',
      initialTotalDuration: const Duration(
        seconds: 5,
      ),
      state: MCTTimerState.play,
    ),
    MCTTimerDomain.buildNew(
      name: 'Test 3',
      initialTotalDuration: const Duration(
        seconds: 8,
      ),
      state: MCTTimerState.play,
    )
  ];

  @override
  List<MCTTimerDomain> findAll() {
    return all;
  }

  @override
  MCTTimerDomain create(String name, Duration duration) {
    MCTTimerDomain timer = MCTTimerDomain.buildNew(
      initialTotalDuration: duration,
      name: name,
      state: MCTTimerState.play,
    );
    all.add(timer);
    print('total: ${timer.totalDuration}, remaining: ${timer.remainingDuration}');
    update();
    return timer;
  }
}
