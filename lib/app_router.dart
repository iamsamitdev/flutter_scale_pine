import 'package:flutter_scale/screens/dashboard/dashboard_screen.dart';
import 'package:flutter_scale/screens/login/login_screen.dart';
import 'package:flutter_scale/screens/machinedetail/machine_detail_screen.dart';
import 'package:flutter_scale/screens/welcome/welcome_screen.dart';

class AppRouter {

  // Router Map Key
  static const String welcome = 'welcome';
  static const String login = 'login';
  static const String dashboard = 'dashboard';
  static const String machineDetail = 'machineDetail';

  // Router Map
  static get routes => {
    welcome: (context) => const WelcomeScreen(),
    login: (context) => const LoginScreen(),
    dashboard: (context) => const DashboardScreen(),
    machineDetail: (context) => const MachineDetailScreen(),
  };

}