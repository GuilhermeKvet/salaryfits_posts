import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../screens/details_page.dart';

class BodyArgs {
  final String? title;
  final String? body;

  BodyArgs({this.title, this.body});

  static BodyArgs fromJson(Map<String, dynamic> json) {
    return BodyArgs(
      title: json['title'],
      body: json['body'],
    );
  }
}

class DetailsPageRoute extends NuRoute<NuRouter, BodyArgs, String> {
  @override
  Widget build(BuildContext context, NuRouteSettings<BodyArgs?> settings) {
    return DetailsPage(
      title: settings.args!.title,
      body: settings.args!.body,
    );
  }

  @override
  ParamsParser<BodyArgs> get paramsParser => BodyArgs.fromJson;

  @override
  String get path => 'detailsPage';

  @override
  ScreenType get screenType => materialScreenType;
}
