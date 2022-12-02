import 'package:clean_core/clean_core.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTTimerDomain extends BasicDomainObject {
  int id;

  String name;

  MCTTimerState state;

  //ultima vez que se actualizo el contador:
  //cuando de crea y se da play
  //cuando se le da pausa y play, en el play actualiza
  //siempre en el PLAY se actualiza
  DateTime? lastStartedAt;

  //lo que le queda actualmente
  //cuando inicia es la duracion total
  //si se para y se vuelve a correr la duracion total es lo que quedaba pendiente
  late Duration totalDuration;

  //duracion inicial, esta no cambia
  //para cuando se reinicia el contador
  Duration initialTotalDuration;

  MCTTimerDomain.buildNew({
    required this.initialTotalDuration,
    required this.state,
    this.name = "",
    this.id = 0,
  }) {
    if (state == MCTTimerState.play) {
      lastStartedAt = DateTime.now();
    }
    totalDuration = initialTotalDuration;
  }

  MCTTimerDomain({
    required this.lastStartedAt,
    required this.totalDuration,
    required this.initialTotalDuration,
    required this.state,
    this.name = "",
    this.id = 0,
  });

  Duration get remainingDuration {
    int elapsedMilliSeconds = 0;
    if (state == MCTTimerState.play && lastStartedAt != null) {
      elapsedMilliSeconds = DateTime.now().millisecondsSinceEpoch -
          lastStartedAt!.millisecondsSinceEpoch;
    }

    int remainingMilliSeconds =
        totalDuration.inMilliseconds - elapsedMilliSeconds;
    return remainingMilliSeconds <= 0
        ? const Duration()
        : Duration(milliseconds: elapsedMilliSeconds);
  }
}
