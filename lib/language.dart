class JdoodleLanguage {
  JdoodleLanguage({
    required this.name,
    required this.code,
    required this.version,
    required this.versionIndex,
  });

  final String name;
  final String code;
  final String version;
  final String versionIndex;
}

final languages = <JdoodleLanguage>[
  JdoodleLanguage(
    name: 'Java',
    code: 'java',
    version: 'JDK 1.8.0_66',
    versionIndex: '0',
  )
];
