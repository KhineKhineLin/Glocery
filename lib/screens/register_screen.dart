import 'package:flutter/material.dart';
class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Hero(
                tag: 'logo',
                child: Image.asset('images/logo.jpg')),
              TextField(),
              TextField(),
              TextField(),
              TextField()
            ],
          ),
        ),
      ),
    );
  }
}