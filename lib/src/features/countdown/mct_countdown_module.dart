import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class USSDCountdownModule {
  static Future init() async {

    Get.put<MCTCountdownController>(MCTCountdownControllerImpl());
  }

}
