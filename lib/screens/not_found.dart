import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../core/app_images.dart';

class NotFoundPage extends StatelessWidget {
  final dynamic onEnterHomePage;

  const NotFoundPage({required this.onEnterHomePage, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                Image.asset(
                  AppImages.error,
                  width: double.maxFinite,
                  height: 300,
                ),
                const Text(
                  'Não foi possível localizar nenhum post.',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () => onEnterHomePage(),
                    child: const Text("Recarregar"),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
