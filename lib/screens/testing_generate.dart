import 'package:flutter/material.dart';

class TestingGenerate extends StatelessWidget {
  const TestingGenerate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: List<Widget>.generate(12, (index) {
          return Text(index.toString());
        }),
      ),
    );
  }
}
