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

  final String name;
  final String code;
  List<String> versions;
  int currVersionIndex = 0;

  set version(String version) => currVersionIndex = versions.indexOf(version);
  String get version => versions[currVersionIndex];

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'code': code,
      'versions': versions.toSet().toList(),
    };
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
