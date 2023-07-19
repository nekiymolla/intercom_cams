import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cams/authorization/authorization_page.dart';
import 'package:cams/authorization/enter_page.dart';
import 'package:cams/authorization/registration_page.dart';
import 'package:cams/mian_pages/cams_page.dart';

@MaterialAutoRouter(routes: [
  AutoRoute(
    page: EnterPage,
    initial: true,
  ),
  AutoRoute(
    page: RegistrationPage,
  ),
  AutoRoute(
    page: AuthPage,
  ),
  AutoRoute(page: CamsPage, name: 'campagerouter', path: '/campageroute'),
])
class $AppRoute {}
