import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:jdoodle/providers/code_editor_provider.dart' show codeProvider;
import 'package:jdoodle/providers/websocket_service_provider.dart';

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
    return Container(
      height: 300,
      child: CodeEditor(),
    );
  }

  Widget _buildBottomMenu() {
    return Row(
      children: [
        Icon(Icons.place),
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
      textStyle: TextStyle(fontFamily: 'SourceCode'),
    );
  }
}
