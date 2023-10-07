import 'package:flutter/material.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('profile page'),
      ),
      body: const Center(
        child: Column(
          children: [Text("profile page")],
        ),
      ),
    );
  }
}
