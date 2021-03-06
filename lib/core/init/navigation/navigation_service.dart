import 'package:flutter/material.dart';
import 'inavigation_service.dart';

class NavigationService implements INavigationService {
  static final NavigationService _instace = NavigationService._init();
  static NavigationService get instance => _instace;

  NavigationService._init();

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  get removeAllOldRoutes => (Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage(String path, {Object? data}) async {
    await navigatorKey.currentState!.pushNamed(path, arguments: data);
  }

  @override
  Future<void> navigateToPageClear(String path, {Object? data}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path, removeAllOldRoutes, arguments: data);
  }
}
