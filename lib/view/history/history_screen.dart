import 'package:flutter/material.dart';

class ScreenHistory extends StatelessWidget {
  const ScreenHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text('history page'),
      ),
      body: const Center(
        child: Column(
          children: [Text("history page")],
        ),
      ),
    );
  }
}
