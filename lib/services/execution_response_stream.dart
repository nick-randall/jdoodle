import 'dart:async';

import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/services/websocket_service.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class ExecutionResponseStream {
  ExecutionResponseStream() {
    final websocketService = WebsocketService();
    messageStream = websocketService.streamController;
    executionResponseTransformer =
        StreamTransformer.fromHandlers(handleData: handleMessageFromServer);
  }
  late StreamController<StompFrame> messageStream;
  late StreamTransformer<StompFrame, ExecutionResponse>
      executionResponseTransformer;

  Stream<ExecutionResponse> get stream =>
      messageStream.stream.transform(executionResponseTransformer);

  void handleMessageFromServer(
    StompFrame message,
    EventSink<ExecutionResponse> sink,
  ) {
    final messageBody = message.body;
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && messageBody == 'Token Expired') {
        _handleExpiredToken();
      } else if (statusCode == 204) {
        // Just a number representing time it took to calculate
        sink.add(
          ComputeTimeExecutionResponse(
            computeTime: double.parse(messageBody!),
          ),
        );
      } else if (statusCode == 200) {
        sink.add(StdOutExecutionResponse(stdout: messageBody!));
      } else {
        sink.add(ExecutionResponse());
      }
      print('status code: $statusCode');
    }
  }

  void _handleExpiredToken() {
    print('Token is Expired! Attempting to re-establish connection');
    WebsocketService().reestablishConnection();
  }
}
