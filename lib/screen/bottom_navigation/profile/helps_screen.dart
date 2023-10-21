import 'package:flutter/material.dart';

class HelpsScreen extends StatefulWidget {
  const HelpsScreen({super.key});

  @override
  State<HelpsScreen> createState() => _HelpsScreenState();
}

class _HelpsScreenState extends State<HelpsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        title: const Text(
          'Helps',
        ),
      ),
      body: const Center(child:  Text('Helps')),
    );
  }
}
