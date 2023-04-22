import 'dart:async';
import 'dart:convert';

import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/services/websocket_service.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

class CodeExecutionService {
  CodeExecutionService() {
    websocketService.streamController.stream.listen(_websocketReconnectHandler);
  }
  static const _sendDestination = '/app/execute-ws-api-token';

  final WebsocketService websocketService = WebsocketService();
  StreamController<StompFrame> websocketStream =
      WebsocketService().streamController;
  Code? cachedExecutionAttempt;

  void _websocketReconnectHandler(StompFrame event) {
    if (event.command == 'CONNECTED' &&
        cachedExecutionAttempt != null &&
        websocketService.websocket.isConnected) {
      print("attempting to run cached execution");
      sendExecuteScriptMessageToServer(code: cachedExecutionAttempt!);
      cachedExecutionAttempt = null;
    }
  }

  void sendExecuteScriptMessageToServer({
    required Code code,
  }) {
    final websocket = websocketService.websocket;
    cachedExecutionAttempt = code;

    if (websocket.client.connected) {
      print(code.text);
      print(code.language.code);
      print(code.language.name);
      final data = jsonEncode({
        'script': code.text,
        'language': code.language.code,
        'versionIndex': code.language.currVersionIndex,
      });
      websocket.client.send(
        destination: _sendDestination,
        body: data,
        headers: {
          'message_type': 'execute',
          'token': websocket.token,
        },
      );
    } else {
      websocketService.reestablishConnection();
      print('ERROR: Attempt to use Websocket but is not yet connected!');
    }
  }

  void sendInputMessageToServer({
    required String input,
  }) {
    final websocket = websocketService.websocket;
    if (websocket.isConnected) {
      websocket.client.send(
        destination: _sendDestination,
        body: input,
        headers: {'message_type': 'input'},
      );
    }
  }
}
