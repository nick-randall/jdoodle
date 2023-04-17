import 'package:jdoodle/language.dart';

class CodeExecutionState {
  CodeExecutionState({
    required this.language,
    required this.waitingForStdInput,
    required this.executionTime,
    this.compileTime,
    this.body = '',
  });

  CodeExecutionState.initial({required this.language})
      : waitingForStdInput = true,
        body = '',
        executionTime = null,
        compileTime = null;

  final JdoodleLanguage language;
  String body = '';
  final bool waitingForStdInput;
  final double? executionTime;
  final double? compileTime;

  CodeExecutionState copyWith({
    JdoodleLanguage? language,
    String? body,
    bool? waitingForStdInput,
    double? executionTime,
    double? compileTime,
  }) {
    return CodeExecutionState(
      language: language ?? this.language,
      body: body ?? this.body,
      waitingForStdInput: waitingForStdInput ?? this.waitingForStdInput,
      executionTime: executionTime ?? this.executionTime,
      compileTime: compileTime ?? this.compileTime,
    );
  }
}
