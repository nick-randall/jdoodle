import 'dart:async';

import 'package:jdoodle/models/execution_response.dart';
import 'package:jdoodle/presentation/pages/execution_page.dart';
import 'package:jdoodle/services/websocket_service.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

// This class's main responsibility is to take the websocket messages
// from Stomp and convert them into meaningful execution repsonse objects
// to be consumed by the UI and/or saved.
class ExecutionResponseStream {
  ExecutionResponseStream()
      : messageStream = WebsocketService().streamController {
    responseTransformer = StreamTransformer.fromHandlers(
      handleData: _handleMessageFromServer,
    );
  }
  StreamController<StompFrame> messageStream;
  late StreamTransformer<StompFrame, ExecutionResponse> responseTransformer;

  Stream<ExecutionResponse> get stream =>
      messageStream.stream.transform(responseTransformer);
  bool awaitingEndOfExecutionsResponse = false;

  void _handleMessageFromServer(
    StompFrame message,
    EventSink<ExecutionResponse> sink,
  ) {
    final messageBody = message.body;
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && messageBody == 'Token Expired') {
        _handleExpiredToken();
      } else if (statusCode == 200) {
        sink.add(StdOutReceivedResponse(stdout: messageBody!));
      } else if (statusCode == 201) {
        sink.add(RequestReceivedResponse());
      } else if (statusCode == 204) {
        // Just a number representing time it took to calculate
        // But it also signals the end.
        sink.add(
          EndOfExecutionsResponse(
            computeTime: double.parse(messageBody!),
          ),
        );
      } else if (statusCode == 508) {
        print(messageBody); // sink.add(ErrorResponse(messageBody));
        sink.add(ServerTimeoutResponse(message: messageBody!));
      } else if (statusCode == 503) {
        sink.add(ErrorResponse(messageBody));
      } else if (statusCode == 417) {
        sink.add(StdOutReceivedResponse(stdout: messageBody!));
      }
      print('status code: $statusCode');
    }
  }

  void _handleExpiredToken() {
    print('Token is Expired! Attempting to re-establish connection');
    WebsocketService().reestablishConnection();
  }
}
