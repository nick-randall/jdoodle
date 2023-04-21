import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/services/execution_response_stream.dart';

final executionProvider =
    StateNotifierProvider<ExecutionNotifier, AsyncValue<ExecutionState>>(
  ExecutionNotifier.new,
);

class ExecutionNotifier extends StateNotifier<AsyncValue<ExecutionState>> {
  ExecutionNotifier(this.ref) : super(const AsyncValue.loading()) {
    responseStream.listen(_updatestate);
  }
  final Ref ref;

  final Stream<ExecutionResponse> responseStream =
      ExecutionResponseStream().stream;
  void _updatestate(ExecutionResponse response) {
    final prevState = state.value;
    if (response is StdOutReceivedResponse) {
      state = AsyncValue.data(
        ExecutionState(
          body: response.stdout,
          awaitingUserResponse: false,
          executionTime: 0,
        ),
      );
      Timer(
        const Duration(milliseconds: 500),
        _setToAwaitingUserResponse,
      );
    } else if (response is EndOfExecutionsResponse) {
      state = AsyncValue.data(
        ExecutionState(
          body: prevState?.body ?? '',
          awaitingUserResponse: false,
          executionTime: response.computeTime,
        ),
      );
    }
  }

  void _setToAwaitingUserResponse() {
    final prevState = state.value;
    if (prevState != null) {
      state = AsyncValue.data(
        prevState.copyWith(
          awaitingUserResponse: false,
        ),
      );
    }
  }
}

class ExecutionState {
  ExecutionState({
    required this.body,
    required this.awaitingUserResponse,
    required this.executionTime,
  });
  String body;
  double executionTime;
  bool awaitingUserResponse;

  ExecutionState copyWith({
    String? body,
    double? executionTime,
    bool? awaitingUserResponse,
  }) {
    return ExecutionState(
      body: body ?? this.body,
      executionTime: executionTime ?? this.executionTime,
      awaitingUserResponse: awaitingUserResponse ?? this.awaitingUserResponse,
    );
  }
}

// class ExecutionState extends Equatable {
//   const ExecutionState({required this.body});

//   final String body;
//   @override
//   List<Object?> get props => [body];
// }

// class AwaitingUserInput extends ExecutionState {
//   const AwaitingUserInput({required super.body});

// }
