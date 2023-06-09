import 'package:code_text_field/code_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/highlighting.dart';
import 'package:jdoodle/constants/icons.dart';
import 'package:jdoodle/constants/text_styles.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/presentation/widgets/code_editor.dart';
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
