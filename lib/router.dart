import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:salaryfits_posts/routes/post_route.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => 'home';

  @override
  List<NuRoute> get registerRoutes => [
        HomePageRoute(),
      ];
}

Widget build(BuildContext context) {
  return Nuvigator(
    router: MyRouter(),
  );
}
