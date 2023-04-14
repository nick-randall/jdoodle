import 'package:jdoodle/models/code_error.dart';

class CodeModel {
  CodeModel({required this.language});
  String text = "";
  String language;
  List<CodeError> codeErrors = [];
}
