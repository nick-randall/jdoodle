class JdoodleLanguage {
  JdoodleLanguage({
    required this.name,
    required this.code,
    required this.versions,
    this.currVersion = 0,
  });

  final String name;
  final String code;
  List<String> versions;
  int currVersion = 0;

  JdoodleLanguage withNewVersion({required int version}) => JdoodleLanguage(
        name: name,
        code: code,
        versions: versions,
        currVersion: version,
      );
}

final java = JdoodleLanguage(
  name: 'Java',
  code: 'java',
  versions: [
    'JDK 1.8.0_66',
  ],
);

final languages = <JdoodleLanguage>[java];
