import 'package:jdoodle/models/code_model.dart';
import 'package:jdoodle/services/code_service.dart';

class CodeServiceImpl extends CodeService {
  static const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
  static const clientSecret =
      "af8fc15e85d33fd1f704f2f322cd9fcb3effbce9ee641c5fc767f47b975cc4f4";

  // final websocketProvider =

  CodeServiceImpl(super.codeStream);

  @override
  CodeModel handleCodeFromServer(CodeModel code) {
    // TODO: implement handleCodeFromServer
    throw UnimplementedError();
  }

  @override
  Future<void> writeCodeToServer(CodeModel code) {
    // TODO: implement writeCodeToServer
    throw UnimplementedError();
  }
}
