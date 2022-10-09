import 'package:flutter/material.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/route_generator.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> navKey = GlobalKey<NavigatorState>();
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
