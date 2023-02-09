import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:salaryfits_posts/screens/error_page.dart';

class ErrorPageRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return ErrorPage();
  }

  @override
  String get path => 'notFound';

  @override
  ScreenType get screenType => materialScreenType;
}
