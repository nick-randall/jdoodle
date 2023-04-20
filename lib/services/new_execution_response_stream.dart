import 'dart:async';

import 'package:jdoodle/providers/execution_provider.dart';
import 'package:jdoodle/services/websocket_service.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

// This class's main responsibility is to take the websocket messages
// from Stomp and convert them into meaningful execution repsonse objects
// to be consumed by the UI and/or saved.
class NewExecutionResponseStream {
  NewExecutionResponseStream()
      : messageStream = WebsocketService().streamController {
    responseTransformer = StreamTransformer.fromHandlers(
      handleData: _handleMessageFromServer,
    );
  }
  StreamController<StompFrame> messageStream;
  late StreamTransformer<StompFrame, ExecutionState> responseTransformer;

  Stream<ExecutionState> get stream =>
      messageStream.stream.transform(responseTransformer);
  bool awaitingEndOfExecutionsResponse = false;
  String body = '';

  Future<void> _handleMessageFromServer(
    StompFrame message,
    EventSink<ExecutionState> sink,
  ) async {
    final messageBody = message.body;
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && messageBody == 'Token Expired') {
        _handleExpiredToken();
      } else if (statusCode == 200) {
        sink.add(
          ExecutionState(
            body: messageBody!,
            awaitingUserResponse: true,
            executionTime: 0,
          ),
        );
        Timer(
          const Duration(milliseconds: 200),
          () => sink.add(
            ExecutionState(
              body: 'body \n $messageBody',
              awaitingUserResponse: false,
              executionTime: 0,
            ),
          ),
        );
      } else if (statusCode == 201) {
        sink.add(
          ExecutionState(
            body: 'body \n $messageBody',
            awaitingUserResponse: false,
            executionTime: 0,
          ),
        );
      } else if (statusCode == 204) {
        // Just a number representing time it took to calculate
        // But it also signals the end.
        sink.add(
          ExecutionState(
            body: body,
            awaitingUserResponse: false,
            executionTime: double.parse(messageBody!),
          ),
        );
      } else {
        // sink.add(ExecutionResponse());
      }
      print('status code: $statusCode');
    }
  }

  void _handleExpiredToken() {
    print('Token is Expired! Attempting to re-establish connection');
    WebsocketService().reestablishConnection();
  }
}
