import 'package:equatable/equatable.dart';

class ExecutionResponse extends Equatable {
  @override
  List<Object?> get props => [];
}

class AwaitingUserInputResponse extends ExecutionResponse {
  AwaitingUserInputResponse({required this.stdout});
  final String stdout;
  @override
  List<Object?> get props => [stdout];
}

class EndOfExecutionsResponse extends ExecutionResponse {
  EndOfExecutionsResponse({required this.computeTime});
  final double computeTime;
  @override
  List<Object?> get props => [computeTime];
}

class RequestReceivedResponse extends ExecutionResponse {
  RequestReceivedResponse();
  // final double computeTime;
  @override
  List<Object?> get props => [];
}
