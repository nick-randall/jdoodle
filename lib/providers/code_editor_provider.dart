import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/constants/hello_world_scripts.dart';
import 'package:jdoodle/constants/languages.dart';
import 'package:jdoodle/language.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/providers/language_provider.dart';
import 'package:jdoodle/services/code_service.dart';
import 'package:jdoodle/services/hive_code_service.dart';
import 'package:jdoodle/services/hive_statistics_service.dart';
import 'package:jdoodle/services/statitsics_service.dart';
import 'package:jdoodle/util/debounce.dart';

final codeProvider =
    StateNotifierProvider<CodeNotifier, Code>(CodeNotifier.new);

final initialCode = Code(
  language: languages
      .firstWhere((element) => element.code == 'java')
      .copyWith(currVersionIndex: 0),
  text: script,
);

class CodeNotifier extends StateNotifier<Code> {
  CodeNotifier(this.ref) : super(initialCode) {
    restorePrevCode();
    resetTimer();
  }
  final Ref ref;
  final CodeService codeService = HiveCodeService();
  final StatisticsService statisticsService = HiveStatisticsService();
  late Timer timer;

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void resetTimer() {
    timer = Timer.periodic(
        const Duration(seconds: 1),
        (timer) => ref.read(statisticsProvider.notifier).addTimeToStats(
              state.language,
              1,
            ));
  }

  set language(JdoodleLanguage language) {
    state = state.copyWith(language: language);
    final snippet = helloWorldScripts[language.code];
    if (snippet != null) {
      state = state.copyWith(text: snippet);
    }
    resetTimer();
  }

  JdoodleLanguage get language => state.language;

  void setVersionIndex(int versionIndex) {
    final prevLanguage = state.language;

    final newLanguage = prevLanguage.copyWith(currVersionIndex: versionIndex);
    state = state.copyWith(language: newLanguage);
  }

  void setVersion(String versionName) {
    final prevLanguage = state.language;
    final versionIndex = prevLanguage.versions.indexOf(versionName);

    final newLanguage = prevLanguage.copyWith(currVersionIndex: versionIndex);
    state = state.copyWith(language: newLanguage);
  }

  String get version => state.language.version;

  void updateCode(String text) {
    saveCode();
    state = state.copyWith(text: text);
  }

  Future<void> saveCode() async {
    const debounceDuration = Duration(milliseconds: 300);
    await ref.debounce(debounceDuration);

    await codeService.setCurrentCode(code: state);
  }

  Future<void> restorePrevCode() async {
    final prevSavedCode = codeService.getCurrentCode();
    if (prevSavedCode != null) {
      state = prevSavedCode;
    }
  }
}

const script = '''
import java.util.Scanner;
 import java.util.NoSuchElementException;

public class MyClass {
 public static void main(String args[]) {
		Scanner scanner = new Scanner(System.in);

		try {
		 System.out.println("Type a Line and enter....");
		String txt = scanner.nextLine();
		System.out.println("You have typed...");
		System.out.println(txt);
		} catch (NoSuchElementException e) {
		    System.out.println("Type something in the Stdin box above....");
		}

	}
}''';
