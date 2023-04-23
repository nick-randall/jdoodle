import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_execution_state.dart';
import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/services/execution_response_stream.dart';

final codeExecutionStateProvider =
    StateNotifierProvider<CodeExecutionStateNotifier, ExecutionState>(
  (ref) => CodeExecutionStateNotifier(),
);

class CodeExecutionStateNotifier extends StateNotifier<ExecutionState> {
  CodeExecutionStateNotifier() : super(ExecutionLoadingState()) {
    ExecutionResponseStream().stream.listen(_handleResponse);
  }
  void resetState() => state = ExecutionLoadingState();

  void _handleResponse(ExecutionResponse response) {
    if (response is RequestReceivedResponse) {
      state = ServerAcknowledgedReceiptState();
    }
    if (response is StdOutReceivedResponse) {
      state = StdOutReceived(stdout: response.stdout);
    }
    if (response is ErrorResponse) {
      state = ExecutionErrorState(message: response.errorMessage);
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
      } else if (prevState is ServerTimeoutResponse) {
        state = ExecutionComplete(
          newStdout: (prevState as ServerTimeoutResponse).message,
          executionTime: response.computeTime,
        );
      }
    }
  }
}
