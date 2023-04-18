import 'package:hive/hive.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/services/code_service.dart';

class HiveCodeService extends CodeService {
  HiveCodeService() {
    Hive
      ..openBox<Code>(filesBox)
      ..openBox<Code>(currFileBox);
  }
  static const filesBox = 'files';
  static const currFileBox = 'currFile';
  static const currFileKey = 'currFileKey';

  @override
  Code? getCode({required String id}) {
    final box = Hive.box<Code>(filesBox);
    return box.get(id);
  }

  @override
  Future<void> writeCodeToDevice({required Code code}) async {
    final box = Hive.box<Code>(filesBox);
    await box.put(code.id, code);
  }

  @override
  List<Code> getAllCodes() {
    final box = Hive.box<Code>(filesBox);
    return box.values.toList();
  }

  @override
  Code? getCurrentCode() {
    final curFileBox = Hive.box<Code>(currFileBox);
    return curFileBox.get(currFileKey);
  }

  @override
  Future<void> setCurrentCode(Code code) async {
    final curFileBox = Hive.box<Code>(currFileBox);
    await curFileBox.put(currFileKey, code);
  }
}
