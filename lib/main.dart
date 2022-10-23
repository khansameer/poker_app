import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/route_generator.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      builder: (context, child) {
        final MediaQueryData data = MediaQuery.of(context);
        return MediaQuery(
          child: child ?? Container(),
          data: data.copyWith(
              textScaleFactor: data.textScaleFactor > 1.0 ? 1.0 : data.textScaleFactor),
        );
      },
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const SplashPage(),
    );
  }
}
