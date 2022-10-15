
import 'package:flutter/material.dart';
import 'package:poker/core/route.dart';
import 'package:poker/features/change_password_page.dart';
import 'package:poker/features/clubBalance/clubBalance_page.dart';
import 'package:poker/features/dashboard/dashboard_page.dart';
import 'package:poker/features/event/event_details_page.dart';
import 'package:poker/features/event/event_page.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/login/varification_page.dart';
import 'package:poker/features/profile/edit_profile_page.dart';
import 'package:poker/features/profile/profile_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/signup/term_codition_page.dart';
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
      case RouteName.dashboard:
        return MaterialPageRoute(
            builder: (_) =>  const DashboardPage(),
            settings: const RouteSettings(name: RouteName.dashboard));
      case RouteName.termCondition:
        String? title = args == null ? null : args as String;
        return MaterialPageRoute(
            builder: (_) =>   TermCoditionPage(title: title,),
            settings: const RouteSettings(name: RouteName.termCondition));
      case RouteName.profile:
        return MaterialPageRoute(
            builder: (_) =>  const ProfilePage(),
            settings: const RouteSettings(name: RouteName.profile));
      case RouteName.editProfile:
        return MaterialPageRoute(
            builder: (_) =>  const EditProfilePage(),
            settings: const RouteSettings(name: RouteName.editProfile));
      case RouteName.changePassword:
        return MaterialPageRoute(
            builder: (_) =>  const ChangePasswordPage(),
            settings: const RouteSettings(name: RouteName.changePassword));

      case RouteName.clubBalance:
        return MaterialPageRoute(
            builder: (_) =>  const ClubBalancePage(),
            settings: const RouteSettings(name: RouteName.clubBalance));
      case RouteName.event:
        return MaterialPageRoute(
            builder: (_) =>  const EventPage(),
            settings: const RouteSettings(name: RouteName.event));
      case RouteName.eventDetails:
        return MaterialPageRoute(
            builder: (_) =>  const EventDetailsPage(),
            settings: const RouteSettings(name: RouteName.eventDetails));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
