import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jdoodle/constants/keys.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/presentation/pages/editor_page.dart';
import 'package:jdoodle/presentation/pages/execution_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Code>(filesBox);
  await Hive.openBox<Code>(currFileBox);
  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends ConsumerWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/code-editor': (BuildContext context) => const EditorPage(),
        '/execution-page': (BuildContext context) => const ExecutionPage()
      },
      home: const EditorPage(),
      theme: ThemeData(textTheme: Typography.whiteMountainView),
    );
  }
}
