import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:highlight/languages/dart.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/providers/code_editor_provider.dart' show codeProvider;
import 'package:jdoodle/services/code_execution_service.dart';

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
    final code = ref.read(codeProvider);
    textEditingController.text = code.text;

    super.initState();
  }

  void _handleExecute() {
    final code = ref.read(codeProvider);
    executionService.sendExecuteScriptMessageToServer(code: code);
    Navigator.pushNamed(context, '/execution-page');
  }

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(codeProvider);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            _buildTextArea(),
            _buildBottomMenu(code),
          ],
        ),
      ),
    );
  }

  Widget _buildTextArea() {
    return const Expanded(
      child: CodeEditor(),
    );
  }

  Widget _buildBottomMenu(Code code) {
    return Row(
      children: [
        IconButton(
          onPressed: _handleExecute,
          icon: playIcon,
        ),
        Column(
          children: [
            Text(
              code.language.name,
              style: TextStyles.header.copyWith(color: Colors.black),
            ),
            Text(
              code.language.version,
              style: TextStyles.header.copyWith(color: Colors.black),
            ),
          ],
        ),
        IconButton(
          onPressed: _handleExecute,
          icon: playIcon,
        ),
      ],
    );
  }
}

class CodeEditor extends ConsumerStatefulWidget {
  const CodeEditor({super.key});

  @override
  _CodeEditorState createState() => _CodeEditorState();
}

class _CodeEditorState extends ConsumerState<CodeEditor> {
  CodeController? _codeController;

  @override
  void initState() {
    super.initState();
    final code = ref.read(codeProvider);
    _codeController = CodeController(
      text: code.text,
      language: dart,

      patternMap: {
        '".*"': const TextStyle(color: Colors.yellow),
        r'[a-zA-Z0-9]+\(.*\)': const TextStyle(color: Colors.green),
      },
      stringMap: {
        'void': const TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
        'print':
            const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
      },
      // theme: monokaiSublimeTheme,
    );
    _codeController?.addListener(() {
      final text = _codeController?.text;
      if (text != null) {
        ref.read(codeProvider.notifier).updateCode(text);
      }
    });
  }

  @override
  void dispose() {
    _codeController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CodeField(
      controller: _codeController!,
      textStyle: TextStyles.codeEditor,
    );
  }
}
