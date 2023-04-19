import 'dart:convert';

import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/services/websocket_service.dart';

class CodeExecutionService {
  static const _sendDestination = '/app/execute-ws-api-token';

  final WebsocketService websocketService = WebsocketService();

  void sendExecuteScriptMessageToServer({
    required Code code,
  }) {
    final websocket = websocketService.websocket;
    if (websocket.isConnected) {
      final data = jsonEncode({
        'script': code.text,
        'language': code.language.code,
        'versionIndex': code.language.currVersionIndex,
      });
      final before = {
        'script': code.text,
        'language': code.language.code,
        'versionIndex': code.language.currVersionIndex,
      };
      websocket.client.send(
        destination: _sendDestination,
        body: data,
        headers: {
          'message_type': 'execute',
          'token': websocket.token,
        },
      );
    } else {
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
