import 'package:flutter/material.dart';
import 'package:salaryfits_posts/utils/format_text.dart';

import '../model/post_model.dart';

class DetailsPage extends StatelessWidget {
  final String? title;
  final String? body;
  final dynamic onEnterHomePage;

  const DetailsPage({
    super.key,
    this.title,
    this.body,
    required this.onEnterHomePage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: const Text(
          'Details',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: onEnterHomePage,
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => onEnterHomePage(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Center(
              child: SizedBox(
                width: 340,
                child: Column(
                  children: [
                    Text(
                      formatText(title!),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const Divider(
                      height: 30,
                      thickness: 1,
                      color: Colors.grey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Text(
                        formatText(body!),
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
