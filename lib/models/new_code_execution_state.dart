import 'package:jdoodle/language.dart';

class NewCodeExecutionState {
  NewCodeExecutionState({
    // required this.language,
    required this.waitingForUserInput,
    required this.executionTime,
    this.compileTime,
    this.body,
  });

  NewCodeExecutionState.initial()
      : waitingForUserInput = true,
        body = null,
        executionTime = null,
        compileTime = null;

  // final JdoodleLanguage language;
  String? body;
  final bool waitingForUserInput;
  final double? executionTime;
  final double? compileTime;

  NewCodeExecutionState copyWith({
    JdoodleLanguage? language,
    String? body,
    bool? waitingForUserInput,
    double? executionTime,
    double? compileTime,
  }) {
    return NewCodeExecutionState(
      // language: language ?? this.language,
      body: body ?? this.body,
      waitingForUserInput: waitingForUserInput ?? this.waitingForUserInput,
      executionTime: executionTime ?? this.executionTime,
      compileTime: compileTime ?? this.compileTime,
    );
  }
}
