import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../screens/home_page.dart';

class HomePageRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const HomePage();
  }

  @override
  String get path => 'home';

  @override
  ScreenType get screenType => materialScreenType;
}
