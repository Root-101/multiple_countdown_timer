import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

abstract class MCTTimerController extends GetxController {
  List<MCTTimerDomain> findAll();

  MCTTimerDomain create(String name, Duration duration);
}
