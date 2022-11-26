import 'package:clean_core/clean_core.dart';

class TimerDomain extends BasicDomainObject {
  int id;

  String name;

  Duration duration;

  TimerDomain.build({
    required this.duration,
    this.name = "",
    this.id = 0,
  });
}
