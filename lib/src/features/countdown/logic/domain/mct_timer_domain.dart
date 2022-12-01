import 'package:clean_core/clean_core.dart';

class MCTTimerDomain extends BasicDomainObject {
  int id;

  String name;

  Duration totalDuration;

  late Duration remainingDuration;

  MCTTimerDomain({
    required this.totalDuration,
    this.name = "",
    this.id = 0,
  }) {
    remainingDuration = totalDuration;
  }
}
