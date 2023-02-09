import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:salaryfits_posts/routes/details_route.dart';
import 'package:salaryfits_posts/routes/home_route.dart';

class MyRouter extends NuRouter {
  @override
  String get initialRoute => 'home';

  @override
  List<NuRoute> get registerRoutes => [
        HomePageRoute(),
        DetailsPageRoute(),
      ];
}

Widget build(BuildContext context) {
  return Nuvigator(
    router: MyRouter(),
  );
}
