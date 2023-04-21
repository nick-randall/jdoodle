import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/language.dart';

import '../constants/languages.dart';

final languageProvider =
    StateNotifierProvider<LanguageNotifier, JdoodleLanguage>(
  (ref) => LanguageNotifier(),
);

class LanguageNotifier extends StateNotifier<JdoodleLanguage> {
  LanguageNotifier() : super(java);

  set language(JdoodleLanguage language) => state = language;
  JdoodleLanguage get language => state;

  set version(String version) => state = state..version = version;
  String get version => state.version;
}
