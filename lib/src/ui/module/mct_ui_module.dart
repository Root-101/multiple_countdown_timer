import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class USSDUIModule {
  static Future init() async {
    //await USSDAppModule.init();

    Get.put<MCTTimerController>(MCTTimerControllerImpl());
  }

}
