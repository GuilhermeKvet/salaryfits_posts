import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  final String? title;
  final String? body;
  final dynamic onEnterHomePage;

  const DetailsPage(
      {super.key, this.title, this.body, required this.onEnterHomePage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Detais',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => onEnterHomePage,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: Text(title!),
    );
  }
}
