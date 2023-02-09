import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? title;
  final String? body;

  const DetailsPage({
    super.key,
    this.title,
    this.body,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text(title!),
    );
  }
}
