import '../models/code_model.dart';

abstract class CodeService {
  final Stream codeStream;

  CodeService(this.codeStream);
  Future<void> writeCodeToServer(CodeModel code);
  CodeModel handleCodeFromServer(CodeModel code);
}
