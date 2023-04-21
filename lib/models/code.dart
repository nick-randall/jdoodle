import 'package:hive/hive.dart';
import 'package:jdoodle/language.dart';
import 'package:uuid/uuid.dart';
part 'code.g.dart';

@HiveType(typeId: 0)
class Code {
  Code({
    required this.language,
    this.fileName,
    this.text = '',
  });
  @HiveField(0)
  final String id = const Uuid().v4();
  @HiveField(1)
  String? fileName;
  @HiveField(2)
  JdoodleLanguage language;
  @HiveField(3)
  String text = '';

  Code copyWith({
    String? fileName,
    JdoodleLanguage? language,
    String? text,
  }) {
    return Code(
      language: language ?? this.language,
      fileName: fileName ?? this.fileName,
      text: text ?? this.text,
    );
  }
}
