import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jdoodle/constants/keys.dart';
import 'package:jdoodle/constants/languages.dart';
import 'package:jdoodle/constants/scripts.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/presentation/pages/code_editor_page.dart';
import 'package:jdoodle/presentation/pages/execution_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox<Code>(filesBox);
  await Hive.openBox<Code>(currFileBox);
  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends StatelessWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/code-editor': (BuildContext context) => const CodeEditorPage(),
        '/execution-page': (BuildContext context) => const ExecutionPage()
      },
      home: const CodeEditorPage(),
      theme: ThemeData(textTheme: Typography.whiteMountainView),
    );
  }
}
