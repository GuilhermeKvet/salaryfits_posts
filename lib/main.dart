import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';
import 'package:salaryfits_posts/router.dart';

void main() {
  runApp(const SalaryFitsPosts());
}

class SalaryFitsPosts extends StatelessWidget {
  const SalaryFitsPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Nuvigator(
        router: MyRouter(),
      ),
    );
  }
}
