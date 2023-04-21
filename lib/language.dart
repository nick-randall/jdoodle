class JdoodleLanguage {
  JdoodleLanguage({
    required this.name,
    required this.code,
    required this.versions,
    this.currVersionIndex = 0,
  });

  final String name;
  final String code;
  List<String> versions;
  int currVersionIndex = 0;

  set version(String version) => currVersionIndex = versions.indexOf(version);
  String get version => versions[currVersionIndex];

  JdoodleLanguage copyWith({
    String? name,
    String? code,
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

final java = JdoodleLanguage(
  name: 'Java',
  code: 'java',
  versions: [
    'JDK 1.8.0_66',
  ],
);

final languages = <JdoodleLanguage>[java];
