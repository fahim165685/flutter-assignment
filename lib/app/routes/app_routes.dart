// ignore_for_file: constant_identifier_names
part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const SPLASH = _Paths.SPLASH;
  static const HOME = _Paths.HOME;
  static const APP_NETWORK = _Paths.APP_NETWORK;
  static const DASHBOARD = _Paths.DASHBOARD;
  static const TIMELINE = _Paths.TIMELINE;
}

abstract class _Paths {
  _Paths._();
  static const SPLASH = '/splash';
  static const HOME = '/home';
  static const APP_NETWORK = '/app-network';
  static const DASHBOARD = '/dashboard';
  static const TIMELINE = '/timeline';
}
