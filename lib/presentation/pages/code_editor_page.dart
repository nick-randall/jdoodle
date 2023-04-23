import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/highlighting.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/presentation/widgets/menu_drawer.dart';
import 'package:jdoodle/providers/code_editor_provider.dart' show codeProvider;
import 'package:jdoodle/services/code_execution_service.dart';

class CodeEditorPage extends ConsumerStatefulWidget {
  const CodeEditorPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CodeEditorPageState();
}

class _CodeEditorPageState extends ConsumerState<CodeEditorPage> {
  TextEditingController textEditingController = TextEditingController();
  final executionService = CodeExecutionService();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _openMenuDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    final code = ref.watch(codeProvider);
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const MenuDrawer(),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: _openMenuDrawer,
          icon: menuIcon,
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
        Row(
          children: [
            IconButton(
              onPressed: _handleExecute,
              icon: playIcon,
            ),
            IconButton(
              onPressed: () => Navigator.pushNamed(context, '/language-select'),
              icon: filterIcon,
            ),
          ],
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
