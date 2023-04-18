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
}

final java = JdoodleLanguage(
  name: 'Java',
  code: 'java',
  versions: [
    'JDK 1.8.0_66',
  ],
);

final languages = <JdoodleLanguage>[java];
