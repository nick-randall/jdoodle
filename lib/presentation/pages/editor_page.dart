import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:jdoodle/providers/code_editor_provider.dart' show codeProvider;
import 'package:jdoodle/providers/web_socket_provider.dart';
import 'package:jdoodle/providers/websocket_service_provider.dart';
import 'package:jdoodle/services/code_execution_service.dart';
import 'package:jdoodle/services/code_service.dart';

class EditorPage extends ConsumerStatefulWidget {
  const EditorPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorPageState();
}

class _EditorPageState extends ConsumerState<EditorPage> {
  TextEditingController textEditingController = TextEditingController();
  final executionService = CodeExecutionService();
  @override
  void initState() {
    print("init");
    final code = ref.read(codeProvider);
    // textEditingController = TextEditingController();
    textEditingController.text = code.text;
    final websocketServiceNotifier = ref
        .read(websocketServiceProvider.notifier)
        .addMessageListener((message) {
      print("message");
    });
    super.initState();
  }

  // void _handleExecute() {
  //   final code = ref.read(codeProvider);
  //   ref
  //       .read(websocketServiceProvider.notifier)
  //       .sendExecuteScriptMessageToServer(
  //         code: code,
  //       );
  // }
  void _handleExecute() {
    final code = ref.read(codeProvider);
    executionService.sendExecuteScriptMessageToServer(code: code);
  }

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(codeProvider);

    // final language = ref.watch(languageProvider);
    // return CodeEditor();
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Text(code.text),
            _buildTextArea(),
            _buildBottomMenu(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextArea() {
    return Expanded(
      child: Container(
        child: const CodeEditor(),
      ),
    );
  }

  Widget _buildBottomMenu() {
    return Row(
      children: [
        GestureDetector(
          onTap: _handleExecute,
          child: const Icon(Icons.play_arrow),
        ),
      ],
    );
  }
}

class CodeEditor extends StatefulWidget {
  const CodeEditor({super.key});

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends State<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final source = "void main() {\n    print(\"Hello, world!\");\n}";
    // Instantiate the CodeController
    _codeController = CodeController(
      text: source,
      language: dart,
      patternMap: {
        r'".*"': const TextStyle(color: Colors.yellow),
        r'[a-zA-Z0-9]+\(.*\)': const TextStyle(color: Colors.green),
      },
      stringMap: {
        "void": const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        "print":
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      },
      // theme: monokaiSublimeTheme,
    );
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeField(
      expands: true,
      controller: _codeController!,
      textStyle: const TextStyle(fontFamily: 'SourceCode'),
    );
  }
}
