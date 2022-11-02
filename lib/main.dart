import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:poker/core/route.dart';
import 'package:poker/core/route_generator.dart';
import 'package:poker/core/services/provider/provider.dart';
import 'package:poker/core/utils/PreferenceHelper.dart';
import 'package:poker/core/utils/app_color.dart';
import 'package:poker/features/splash/splash_page.dart';
import 'package:provider/provider.dart';

import 'package:provider/single_child_widget.dart';


List<SingleChildWidget> providers = [
  ChangeNotifierProvider<LoginProvider>(create: (_) => LoginProvider()),
];


Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  PreferenceHelper.load().then((value) {});
  await Firebase.initializeApp(
  );
  runApp(
    MultiProvider(
      providers: providers,
      child: const MyApp(),
    ),
  );}

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
        unselectedWidgetColor: AppColor.colorWhite,
        primarySwatch: Colors.blue,
      ),
      home:  const SplashPage(),
    );
  }
}
