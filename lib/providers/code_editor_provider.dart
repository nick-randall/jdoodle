import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/language.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/services/code_service.dart';
import 'package:jdoodle/services/hive_code_service.dart';
import 'package:jdoodle/util/debounce.dart';

final codeProvider =
    StateNotifierProvider<CodeNotifier, Code>(CodeNotifier.new);

final initialCode = Code(
  language: languages.first.copyWith(currVersionIndex: 4),
  text: script,
);

class CodeNotifier extends StateNotifier<Code> {
  CodeNotifier(this.ref) : super(initialCode) {
    restorePrevCode();
  }
  final Ref ref;
  final CodeService codeService = HiveCodeService();

  set language(JdoodleLanguage language) => state.language = language;
  JdoodleLanguage get language => state.language;

  set version(String version) => state = state..language.version = version;

  String get version => state.language.version;

  void updateCode(String text) {
    state = state.copyWith(text: text);
  }

  Future<void> saveCode() async {
    const debounceDuration = Duration(milliseconds: 300);
    await ref.debounce(debounceDuration);

    await codeService.writeCodeToDevice(code: state);
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
}''';
