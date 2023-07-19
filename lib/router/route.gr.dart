// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../authorization/authorization_page.dart' as _i3;
import '../authorization/enter_page.dart' as _i1;
import '../authorization/registration_page.dart' as _i2;
import '../mian_pages/cams_page.dart' as _i4;

class AppRoute extends _i5.RootStackRouter {
  AppRoute([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    EnterPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.EnterPage(),
      );
    },
    RegistrationPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.RegistrationPage(),
      );
    },
    AuthPageRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.AuthPage(),
      );
    },
    Campagerouter.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.CamsPage(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          EnterPageRoute.name,
          path: '/',
        ),
        _i5.RouteConfig(
          RegistrationPageRoute.name,
          path: '/registration-page',
        ),
        _i5.RouteConfig(
          AuthPageRoute.name,
          path: '/auth-page',
        ),
        _i5.RouteConfig(
          Campagerouter.name,
          path: '/campageroute',
        ),
      ];
}

/// generated route for
/// [_i1.EnterPage]
class EnterPageRoute extends _i5.PageRouteInfo<void> {
  const EnterPageRoute()
      : super(
          EnterPageRoute.name,
          path: '/',
        );

  static const String name = 'EnterPageRoute';
}

/// generated route for
/// [_i2.RegistrationPage]
class RegistrationPageRoute extends _i5.PageRouteInfo<void> {
  const RegistrationPageRoute()
      : super(
          RegistrationPageRoute.name,
          path: '/registration-page',
        );

  static const String name = 'RegistrationPageRoute';
}

/// generated route for
/// [_i3.AuthPage]
class AuthPageRoute extends _i5.PageRouteInfo<void> {
  const AuthPageRoute()
      : super(
          AuthPageRoute.name,
          path: '/auth-page',
        );

  static const String name = 'AuthPageRoute';
}

/// generated route for
/// [_i4.CamsPage]
class Campagerouter extends _i5.PageRouteInfo<void> {
  const Campagerouter()
      : super(
          Campagerouter.name,
          path: '/campageroute',
        );

  static const String name = 'Campagerouter';
}
