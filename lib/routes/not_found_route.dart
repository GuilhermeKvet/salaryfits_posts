import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:salaryfits_posts/screens/not_found.dart';

class NotFoundPageRoute extends NuRoute {
  @override
  Widget build(BuildContext context, NuRouteSettings<Object?> settings) {
    return const NotFoundPage();
  }

  @override
  String get path => 'notFound';

  @override
  ScreenType get screenType => materialScreenType;
}
