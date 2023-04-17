import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/script.dart';

final codeEditorProvider =
    StateNotifierProvider<CodeEditorNotifier, String>(CodeEditorNotifier.new);

class CodeEditorNotifier extends StateNotifier<String> {
  CodeEditorNotifier(this.ref) : super(testScript);
  final Ref ref;
}
