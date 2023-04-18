import 'package:code_editor/code_editor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/code_editor_provider.dart';
import 'package:jdoodle/providers/code_execution_provider.dart';
import 'package:jdoodle/providers/language_provider.dart';

import '../../providers/websocket_service_provider.dart';

class EditorPage extends ConsumerStatefulWidget {
  const EditorPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorPageState();
}

class _EditorPageState extends ConsumerState<EditorPage> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    final code = ref.read(codeProvider);
    // textEditingController = TextEditingController();
    textEditingController.text = code.text;
    super.initState();
  }

  void _handleExecute() {
    final code = ref.read(codeProvider);
    ref
        .read(websocketServiceProvider.notifier)
        .sendExecuteScriptMessageToServer(
          code: code,
        );
  }

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(codeProvider);

    // final language = ref.watch(languageProvider);
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(code.text),
            _buildTextArea(),
            _buildBottomMenu(),
          ],
        ),
      ),
    );
  }

  // Widget _buildTextArea() => CodeEditor(
  //       textEditingController: textEditingController,
  //     );
  Widget _buildTextArea() => TextField(
        controller: textEditingController,
      );
  Widget _buildBottomMenu() => Container();
}
