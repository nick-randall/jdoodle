import 'package:equatable/equatable.dart';

class ExecutionResponse extends Equatable {
  @override
  List<Object?> get props => [];
}

class StdOutExecutionResponse extends ExecutionResponse {
  StdOutExecutionResponse({required this.stdout});
  final String stdout;
  @override
  List<Object?> get props => [stdout];
}

class ComputeTimeExecutionResponse extends ExecutionResponse {
  ComputeTimeExecutionResponse({required this.computeTime});
  final double computeTime;
  @override
  List<Object?> get props => [computeTime];
}
