import 'package:albalarma/presentation/features/alarm/alarm_page.dart';
import 'package:albalarma/presentation/features/location/location_page.dart';
import 'package:albalarma/presentation/features/notifications/notifications.dart';
import 'package:albalarma/presentation/features/radio/radio.dart';
import 'package:albalarma/presentation/features/splash/splash.dart';
import 'package:albalarma/presentation/home.dart';
import 'package:auto_route/annotations.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    AutoRoute(page: SplashScreen, initial: true),
    AutoRoute(page: Radio),
    AutoRoute(page: LocationPage),
    AutoRoute(page: AlarmPage),
  ],
)
class $AppRouter {}
