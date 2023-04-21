import 'package:equatable/equatable.dart';

class ExecutionState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ExecutionLoadingState extends ExecutionState {
  final String waitMessage = 'Running the program...';
  @override
  List<Object?> get props => [waitMessage];
}

class ServerAcknowledgedReceiptState extends ExecutionLoadingState {}

class ExecutionErrorState extends ExecutionState {
  final String errorMessage =
      'Something went wrong.\n Contact jDoodle or\n you can try again.';
  @override
  List<Object?> get props => [errorMessage];
}

// class SessionExpiredState extends ExecutionErrorState {}
// Because we have automatic session renewal and cached request sending, for
// the user this  should just
// seem like a longer wait time. So we don't need to have an 'Error State'
// asking for user input at this point.
class SessionExpiredState extends ExecutionLoadingState {
  @override
  String get waitMessage => 'Still waiting on server...';

  @override
  List<Object?> get props => [waitMessage];
}

class ExecutionSuccessState extends ExecutionState {
  ExecutionSuccessState({
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

class StdOutReceived extends ExecutionSuccessState {
  StdOutReceived({required super.stdout}) : super(awaitingUserInput: true);
}

class StdOutWithStdIn extends ExecutionSuccessState {
  StdOutWithStdIn({required String newStdout})
      : super(awaitingUserInput: true, stdout: newStdout);
}

class ExecutionComplete extends ExecutionSuccessState {
  ExecutionComplete({
    required String newStdout,
    required super.executionTime,
  }) : super(awaitingUserInput: false, stdout: newStdout);
}
