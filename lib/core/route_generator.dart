
import 'package:flutter/material.dart';
import 'package:poker/Admin/features/add_member/add_member_page.dart';
import 'package:poker/admin/features/accounting/admin_accounting_page.dart';
import 'package:poker/admin/features/accounting/admin_total_account_details.dart';
import 'package:poker/admin/features/credit_file/admin_credit_file.dart';
import 'package:poker/admin/features/counter/admin_counter.dart';
import 'package:poker/admin/features/credit_request/credit_request_page.dart';
import 'package:poker/admin/features/credit_request/trade_history_page.dart';
import 'package:poker/admin/features/schedule/admin_schedule_page.dart';
import 'package:poker/admin/features/dashboard/admin_dashboard_page.dart';
import 'package:poker/admin/features/memebers/memebers_page.dart';
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
        bool? isAdmin = args == null ? null : args as bool;
        return MaterialPageRoute(
            builder: (_) =>   ClubBalancePage(isAdmin),
            settings: const RouteSettings(name: RouteName.clubBalance));
      case RouteName.event:
        bool? isAdmin = args == null ? null : args as bool;
        return MaterialPageRoute(

            builder: (_) =>   EventPage(isAdmin),
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
        bool? isAdmin = args == null ? null : args as bool;
        return MaterialPageRoute(
            builder: (_) =>   LiveStreamPage(isAdmin),
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
      case RouteName.membersPage:
        return MaterialPageRoute(
            builder: (_) =>  const MembersPage(),
            settings: const RouteSettings(name: RouteName.membersPage));
      case RouteName.adminDashboard:
        return MaterialPageRoute(
            builder: (_) =>  const AdminDashboardPage(),
            settings: const RouteSettings(name: RouteName.adminDashboard));
      case RouteName.adminCounter:
        return MaterialPageRoute(
            builder: (_) =>   AdminCounterPage(),
            settings: const RouteSettings(name: RouteName.adminCounter));
      case RouteName.adminAccounting:
        return MaterialPageRoute(
            builder: (_) =>   AdminAccountingPage(),
            settings: const RouteSettings(name: RouteName.adminAccounting));
      case RouteName.adminTotalAccountDetails:
        return MaterialPageRoute(
            builder: (_) =>   AdminTotalAccountDetailsPage(),
            settings: const RouteSettings(name: RouteName.adminTotalAccountDetails));
      case RouteName.adminCreditFilePage:
        return MaterialPageRoute(
            builder: (_) =>   AdminCreditFilePage(),
            settings: const RouteSettings(name: RouteName.adminCreditFilePage));

      case RouteName.adminCreditRequestPage:
        return MaterialPageRoute(
            builder: (_) =>   CreditRequestPage(),
            settings: const RouteSettings(name: RouteName.adminCreditRequestPage));
      case RouteName.adminTradeHistoryPage:
        return MaterialPageRoute(
            builder: (_) =>   TradeHistoryPage(),
            settings: const RouteSettings(name: RouteName.adminTradeHistoryPage));

      default:
        return MaterialPageRoute(
            builder: (_) =>
                const Scaffold(body: SafeArea(child: Text('Route Error'))));
    }
  }
}
