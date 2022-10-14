import 'package:flutter/material.dart';

class KotobaFormScreen extends StatelessWidget {
  const KotobaFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ことばをのこそう')),
      body: const Center(
          child: Text('ことばをのこそう', style: TextStyle(fontSize: 32.0))),
    );
  }
}
