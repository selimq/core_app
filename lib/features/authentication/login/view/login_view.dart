import 'package:core_app/core/extension/context_extension.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.network(
          "https://mir-s3-cdn-cf.behance.net/projects/max_808/e1e249101199735.Y3JvcCw2MTE4LDQ3ODYsNDA4LDA.jpg",
          scale: 3,
        ),
        centerTitle: true,
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
          color: context.theme.colorScheme.background,
        ),
        child: Column(
          children: [
            TextFormField(),
          ],
        ),
      )),
    );
  }
}
