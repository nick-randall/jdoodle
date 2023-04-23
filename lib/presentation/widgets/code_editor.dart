import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/highlighting.dart';
import 'package:jdoodle/constants/text_styles.dart';

import '../../providers/code_editor_provider.dart';

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

    ref.read(codeProvider.notifier).addListener((code) {
      if (code.text != _codeController?.text) {
        _codeController?.text = code.text;
      }
    });

    _codeController = CodeController(
      text: code.text,
      patternMap: {
        '".*"': const TextStyle(color: Colors.yellow),
        // r'[a-zA-Z0-9]+\(.*\)': const TextStyle(color: Colors.green),
      },
      stringMap: codeHighlighting,
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
