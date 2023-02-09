import 'package:flutter/material.dart';
import 'package:nuvigator/next.dart';

import '../core/app_images.dart';

class ErrorPage extends StatelessWidget {
  final String? image;
  final String message;

  ErrorPage({
    this.message = 'Não foi possível localizar nenhum post.',
    this.image,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final nuvigator = Nuvigator.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Column(
              children: [
                Image.asset(
                  image != null ? image! : AppImages.notfound,
                  width: double.maxFinite,
                  height: 300,
                ),
                Text(
                  message,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    'Verifique sua conexão com a internet.',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: ElevatedButton(
                    onPressed: () => nuvigator!.open("home"),
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
