import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/services/execution_response_stream.dart';

final codeExecutionStateProvider =
    StateNotifierProvider<CodeExecutionStateNotifier, NewExecutionState>(
  (ref) => CodeExecutionStateNotifier(),
);

class CodeExecutionStateNotifier extends StateNotifier<NewExecutionState> {
  CodeExecutionStateNotifier()
      : super(LoadingState()
            // NewExecutionState.initial(
            //     // language: language)
            //     )
            ) {
    ExecutionResponseStream().stream.listen(_handleResponse);
  }
  // Stream<ExecutionResponse> executionResponseStream;
  void resetState() => state = LoadingState();

  void _handleResponse(ExecutionResponse response) {
    if (response is RequestReceivedResponse) {
      state = ServerAcknowledgedReceiptState();
    }
    if (response is StdOutReceivedResponse) {
      state = StdOutReceived(stdout: response.stdout);
    }
    if (response is EndOfExecutionsResponse) {
      final prevState = state;
      if (prevState is StdOutReceived) {
        state = ExecutionComplete(
          newStdout: prevState.stdout,
          executionTime: response.computeTime,
        );
      } else if (prevState is ServerAcknowledgedReceiptState) {
        state = ExecutionComplete(
          newStdout: 'execution complete',
          executionTime: response.computeTime,
        );
      }
    }
  }
}

class NewExecutionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadingState extends NewExecutionState {
  final String waitMessage = 'Running the program...';
  @override
  List<Object?> get props => [waitMessage];
}

class ServerAcknowledgedReceiptState extends LoadingState {}

class ExecutionErrorState extends NewExecutionState {
  final String errorMessage = 'Something went wrong';
  @override
  List<Object?> get props => [errorMessage];
}

// class SessionExpiredState extends ExecutionErrorState {}
// Because we have automatic session renewal and cached request sending, for
// the user this  should just
// seem like a longer wait time. So we don't need to have an 'Error State'
// asking for user input at this point.
class SessionExpiredState extends LoadingState {
  @override
  String get waitMessage => 'Still waiting on server...';

  @override
  List<Object?> get props => [waitMessage];
}

class SuccessState extends NewExecutionState {
  SuccessState({
    required this.stdout,
    required this.awaitingUserInput,
    this.executionTime,
  });

  final String stdout;
  final bool awaitingUserInput;
  final double? executionTime;
  @override
  List<Object?> get props => [
        stdout,
        awaitingUserInput,
        executionTime,
      ];
}

class StdOutReceived extends SuccessState {
  StdOutReceived({required super.stdout}) : super(awaitingUserInput: true);
}

class StdOutWithStdIn extends SuccessState {
  StdOutWithStdIn({required String newStdout})
      : super(awaitingUserInput: true, stdout: newStdout);
}

class ExecutionComplete extends SuccessState {
  ExecutionComplete({
    required String newStdout,
    required super.executionTime,
  }) : super(awaitingUserInput: false, stdout: newStdout);
}
