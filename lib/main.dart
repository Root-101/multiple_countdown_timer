import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:multiple_countdown_timer/mct_exporter.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(SplashScreen());
}

class MCTApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeProvider(
      initTheme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      builder: (context, myTheme) {
        return _app(myTheme);
      },
    );
  }
}

Widget _app(ThemeData theme) {
  return GetMaterialApp(
    title: 'MCT',
    //--------------------- <THEAMING> -----------------------------------
    theme: theme,
    //--------------------- </THEAMING> -----------------------------------
    //--------------------- <PAGINATION> -----------------------------------
    initialRoute: MCTMainScreen.ROUTE_NAME,
    getPages: [
      GetPage(
        name: MCTMainScreen.ROUTE_NAME,
        page: () => MCTMainScreen(),
        transition: Transition.leftToRight,
      ),
      GetPage(
        name: Timer.ROUTE_NAME,
        page: () => Timer(),
        transition: Transition.rightToLeft,
      ),
    ],
    /*unknownRoute: GetPage(
          name: UnknownRouteScreen.ROUTE_NAME,
          page: () => UnknownRouteScreen()),*/
    //--------------------- </PAGINATION> -----------------------------------
  );
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Init.instance.initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          FlutterNativeSplash.remove();
          return MCTApp();
        } else {
          //se supone que nunca salga xq el splash se mantiene hasta que termina de cargar
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}

class Init {
  Init._();

  static final instance = Init._();

  Future initialize() async {
    await USSDUIModule.init();
  }
}
