
import 'package:flutter/material.dart';
import 'package:poker/core/route.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/login/varification_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/splash/splash_page.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(
            builder: (_) => const SplashPage(),
            settings: const RouteSettings(name: RouteName.splashScreen));
      case RouteName.login:
        return MaterialPageRoute(
            builder: (_) => const LoginPage(),
            settings: const RouteSettings(name: RouteName.login));
      case RouteName.signup:
        return MaterialPageRoute(
            builder: (_) =>  const SignupPage(),
            settings: const RouteSettings(name: RouteName.signup));
      case RouteName.verification:
        return MaterialPageRoute(
            builder: (_) =>  const VarificationPage(),
            settings: const RouteSettings(name: RouteName.verification));

      /*case RouteName.experienceScreen:
        return MaterialPageRoute(
            builder: (_) => const ExperienceScreen(),
            settings: const RouteSettings(name: RouteName.experienceScreen));
      case RouteName.editExperienceScreen:
        ExperienceData? experienceModel =
            args == null ? null : args as ExperienceData;
        return MaterialPageRoute(
            builder: (_) =>
                EditExperienceScreen(experienceModel: experienceModel),
            settings:
                const RouteSettings(name: RouteName.editExperienceScreen));*/
     /* case RouteName.editEducationScreen:
        Data? educationModel = args == null ? null : args as Data;
        return MaterialPageRoute(
            builder: (_) => EditEducationScreen(educationModel: educationModel),
            settings: const RouteSettings(name: RouteName.editEducationScreen));
      case RouteName.editCertificateScreen:
        CertificateData? certificateModel =
            args == null ? null : args as CertificateData;
        return MaterialPageRoute(
            builder: (_) =>
                EditCertificateScreen(certificateModel: certificateModel),
            settings:
                const RouteSettings(name: RouteName.editCertificateScreen));*/
/*      case RouteName.loginScreen:
        return MaterialPageRoute(
            builder: (_) => const LoginScreen(),
            settings: const RouteSettings(name: RouteName.loginScreen));
      case RouteName.signUpScreen:
        return MaterialPageRoute(
            builder: (_) => const SignUpScreen(),
            settings: const RouteSettings(name: RouteName.signUpScreen));

      case RouteName.educationScreen:
        return MaterialPageRoute(
            builder: (_) => const EducationScreen(),
            settings: const RouteSettings(name: RouteName.educationScreen));
      case RouteName.editSkill:
        return MaterialPageRoute(
            builder: (_) => const EditSkill(),
            settings: const RouteSettings(name: RouteName.editSkill));
      case RouteName.editProfile:
        return MaterialPageRoute(
            builder: (_) => const EditProfile(),
            settings: const RouteSettings(name: RouteName.editProfile));
      case RouteName.changePassword:
        return MaterialPageRoute(
            builder: (_) => ChangePassword(),
            settings: const RouteSettings(name: RouteName.changePassword));
      case RouteName.imageOpenScreen:
        String? imageUrlPath = args as String;
        return MaterialPageRoute(
            builder: (_) => ImageOpenScreen(imageUrl: imageUrlPath),
            settings: const RouteSettings(name: RouteName.imageOpenScreen));*/
      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
