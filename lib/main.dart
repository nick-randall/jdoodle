import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends StatelessWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("Splash screen"),
    ));
  }
}
