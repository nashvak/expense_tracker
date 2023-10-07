import 'package:flutter/material.dart';

class ScreenRemainder extends StatelessWidget {
  const ScreenRemainder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('remainder page'),
      ),
      body: const Center(
        child: Column(
          children: [Text("remainder page")],
        ),
      ),
    );
  }
}
