import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/code_editor_provider.dart';
import 'package:jdoodle/providers/code_execution_provider.dart';
import 'package:jdoodle/providers/language_provider.dart';

class EditorPage extends ConsumerStatefulWidget {
  const EditorPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditorPageState();
}

class _EditorPageState extends ConsumerState<EditorPage> {
  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);

    return Expanded(
      child: Column(
        children: [TextField()],
      ),
    );
  }
}
