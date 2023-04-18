// ignore_for_file: require_trailing_commas

import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/presentation/pages/editor_page.dart';
import 'package:jdoodle/presentation/pages/execution_page.dart';

const filesBox = 'files';
const currFileBox = 'currFile';
const currFileKey = 'currFileKey';
void main() async {
  await Hive.initFlutter();

  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends ConsumerWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // void inputText(String input) {
    //   print(input);
    //   ref.read(websocketServiceProvider.notifier).sendInputMessageToServer(
    //         input: input,
    //       );
    // }

    return MaterialApp(routes: <String, WidgetBuilder>{
      '/code-editor': (BuildContext context) => CodeEditor(),
      '/execution-page': (BuildContext context) => const ExecutionPage()
    }, home: EditorPage());
    //   Scaffold(
    //       body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
    //     Text('nothing'),
    //     TextField(
    //       onChanged: inputText,
    //     ),
    //     ElevatedButton(
    //         onPressed: simulateSendMessage,
    //         child: const SizedBox(
    //           height: 20,
    //           width: 50,
    //           child: Text('execute code'),
    //         )),
    //   ])),
    // );
  }
}
