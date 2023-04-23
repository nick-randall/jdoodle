import 'package:equatable/equatable.dart';

class ExecutionResponse extends Equatable {
  @override
  List<Object?> get props => [];
}

class StdOutReceivedResponse extends ExecutionResponse {
  StdOutReceivedResponse({required this.stdout});
  final String stdout;
  @override
  List<Object?> get props => [stdout];
}

class ServerTimeoutResponse extends ExecutionResponse {
  ServerTimeoutResponse({required this.message});
  final String message;
  @override
  List<Object?> get props => [message];
}

class EndOfExecutionsResponse extends ExecutionResponse {
  EndOfExecutionsResponse({required this.computeTime});
  final double computeTime;
  @override
  List<Object?> get props => [computeTime];
}

class RequestReceivedResponse extends ExecutionResponse {
  RequestReceivedResponse();
  @override
  List<Object?> get props => [];
}

class ErrorResponse extends ExecutionResponse {
  ErrorResponse([this.errorMessage]);
  final String? errorMessage;
  @override
  List<Object?> get props => [];
}
