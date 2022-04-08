import 'package:core_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        titleSpacing: 0,
        title: Image.network(
          "https://logoipsum.com/logoipsum.png",
          fit: BoxFit.fitWidth,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.reddit),
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
