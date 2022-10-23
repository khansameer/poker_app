
import 'package:flutter/material.dart';
import 'package:poker/Admin/features/add_member/add_member_page.dart';
import 'package:poker/admin/features/add_member/schedule/admin_schedule_page.dart';
import 'package:poker/core/route.dart';
import 'package:poker/features/change_password_page.dart';
import 'package:poker/features/chat_room/chat_room_page.dart';
import 'package:poker/features/clubBalance/clubBalance_page.dart';
import 'package:poker/features/dashboard/dashboard_page.dart';
import 'package:poker/features/event/event_details_page.dart';
import 'package:poker/features/event/event_page.dart';
import 'package:poker/features/live_stream/live_stream_page.dart';
import 'package:poker/features/login/login_page.dart';
import 'package:poker/features/login/varification_page.dart';
import 'package:poker/features/profile/edit_profile_page.dart';
import 'package:poker/features/profile/profile_page.dart';
import 'package:poker/features/reservations/reservations_page.dart';
import 'package:poker/features/signup/signup_page.dart';
import 'package:poker/features/signup/term_codition_page.dart';
import 'package:poker/features/splash/splash_page.dart';
import 'package:poker/features/venue_info/venue_info_page.dart';
import 'package:poker/features/whaton/schedule_page.dart';

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
        bool isAdmin = args as bool;
        return MaterialPageRoute(
            builder: (_) =>  DashboardPage(isAdmin: isAdmin),
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
      case RouteName.chatRoom:
        return MaterialPageRoute(
            builder: (_) =>  const ChatRoomPage(),
            settings: const RouteSettings(name: RouteName.chatRoom));
      case RouteName.whatOn:
        return MaterialPageRoute(
            builder: (_) =>  const SchedulePage(),
            settings: const RouteSettings(name: RouteName.whatOn));

      case RouteName.venueInfo:
        return MaterialPageRoute(
            builder: (_) =>  const VenueInfoPage(),
            settings: const RouteSettings(name: RouteName.venueInfo));
      case RouteName.liveStream:
        return MaterialPageRoute(
            builder: (_) =>  const LiveStreamPage(),
            settings: const RouteSettings(name: RouteName.liveStream));

      case RouteName.reservations:
        return MaterialPageRoute(
            builder: (_) =>  const ReservationsPage(),
            settings: const RouteSettings(name: RouteName.reservations));

      case RouteName.addMemberPage:
        return MaterialPageRoute(
            builder: (_) =>  const AddMemberPage(),
            settings: const RouteSettings(name: RouteName.addMemberPage));
      case RouteName.adminSchedule:
        return MaterialPageRoute(
            builder: (_) =>  const AdminSchedulePage(),
            settings: const RouteSettings(name: RouteName.adminSchedule));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
