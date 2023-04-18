import 'package:jdoodle/models/code.dart';

abstract class CodeService {
  Code? getCode({required String id});
  Future<void> writeCodeToDevice({
    required Code code,
  });
  Code? getCurrentCode();
  List<Code> getAllCodes();
  Future<void> setCurrentCode(Code code);
}
