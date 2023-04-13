import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_model.dart';

final codeProvider = Provider((ref) => CodeProvider());

class CodeProvider extends StateNotifier<CodeModel> {
  CodeProvider() : super(CodeModel());
}
