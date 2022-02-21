import 'package:core_app/features/home/view/home_view.dart';
import 'package:flutter/material.dart';
import '../../components/card/not_found_navigation_widget.dart';
import '../../constants/navigation/navigation_constants.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {
      case NavigationConstants.HOME_VIEW:
        return normalNavigate(const HomeView());
      /*
      case NavigationConstants.ABC_VIEW:
        return normalNavigate(const ABC());
      case NavigationConstants.CALENDAR:
        return normalNavigate(const Calendar()); */
      default:
        return MaterialPageRoute(
          builder: (context) => const NotFoundNavigationWidget(),
        );
    }
  }

  MaterialPageRoute normalNavigate(Widget widget) => MaterialPageRoute(
        builder: (context) => widget,
      );
}
