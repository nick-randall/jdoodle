import 'package:hive_flutter/hive_flutter.dart';

part 'language.g.dart';

@HiveType(typeId: 2)
class JdoodleLanguage {
  JdoodleLanguage({
    required this.name,
    required this.code,
    required this.versions,
    this.currVersionIndex = 0,
  });

  JdoodleLanguage.fromMap(Map<String, dynamic> map)
      : name = map['name'] as String,
        code = map['code'] as String,
        versions = List<String>.from(map['versions'] as List<String>);
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String code;
  @HiveField(2)
  List<String> versions;
  @HiveField(3)
  int currVersionIndex = 0;

  set version(String version) => currVersionIndex = versions.indexOf(version);
  String get version => versions[currVersionIndex];

  @override
  String toString() {
    return '$name($version)';
  }

  JdoodleLanguage copyWith({
    String? name,
    String? code,
    String? version,
    List<String>? versions,
    int? currVersionIndex,
  }) {
    return JdoodleLanguage(
      name: name ?? this.name,
      code: code ?? this.code,
      versions: versions ?? this.versions,
      currVersionIndex: currVersionIndex ?? this.currVersionIndex,
    );
  }
}
