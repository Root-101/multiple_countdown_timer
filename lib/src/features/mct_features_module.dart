import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

class MCTFeaturesModule {
  static Future init() async {

    await USSDCountdownModule.init();
  }

}
