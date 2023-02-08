import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../screens/home_page.dart';

class HomePageRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return HomePage(
      enterHomePage: () => nuvigator.open("home"),
    );
  }

  @override
  String get path => 'home';

  @override
  ScreenType get screenType => materialScreenType;
}
