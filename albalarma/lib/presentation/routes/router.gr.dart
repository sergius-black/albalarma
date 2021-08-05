// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../features/alarm/alarm_page.dart' as _i6;
import '../features/location/location_page.dart' as _i5;
import '../features/radio/radio.dart' as _i4;
import '../features/splash/splash.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SplashScreen();
        }),
    RadioRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.Radio();
        }),
    LocationPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.LocationPage();
        }),
    AlarmPageRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<AlarmPageRouteArgs>(
              orElse: () => const AlarmPageRouteArgs());
          return _i6.AlarmPage(key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(RadioRoute.name, path: '/Radio'),
        _i1.RouteConfig(LocationPageRoute.name, path: '/location-page'),
        _i1.RouteConfig(AlarmPageRoute.name, path: '/alarm-page')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class RadioRoute extends _i1.PageRouteInfo {
  const RadioRoute() : super(name, path: '/Radio');

  static const String name = 'RadioRoute';
}

class LocationPageRoute extends _i1.PageRouteInfo {
  const LocationPageRoute() : super(name, path: '/location-page');

  static const String name = 'LocationPageRoute';
}

class AlarmPageRoute extends _i1.PageRouteInfo<AlarmPageRouteArgs> {
  AlarmPageRoute({_i2.Key? key})
      : super(name, path: '/alarm-page', args: AlarmPageRouteArgs(key: key));

  static const String name = 'AlarmPageRoute';
}

class AlarmPageRouteArgs {
  const AlarmPageRouteArgs({this.key});

  final _i2.Key? key;
}
