import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/websocket_service.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final websocketMessageProvider = StreamProvider<StompFrame>((ref) async* {
  final websocketService = WebsocketService();

  void handleExpiredToken() {
    print('Token is Expired! Attempting to re-establish connection');
    websocketService.reestablishConnection();
  }

  void handleMessageFromServer(StompFrame message) {
    final messageBody = message.body;
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && messageBody == 'Token Expired') {
        handleExpiredToken();
      }
      if (statusCode == 204) {
        // Just a number representing time it took to calculate
      }
      print('status code: $statusCode');
    }
  }

  websocketService.streamController.stream.listen(handleMessageFromServer);
  StompFrame messaged;
  await for (final message in websocketService.streamController.stream) {
    // A new message has been received. Let's add it to the list of all messages.
    // allMessages = [...allMessages, message];
    messaged = message;
    yield messaged;
  }
});
