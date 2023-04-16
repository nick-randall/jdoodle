import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_model.dart';
import 'package:jdoodle/providers/new_web_socket_provider.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

/// This service has the abstract methods for interacting with the websocket
final websocketServiceProvider =
    StateNotifierProvider<WebsocketServiceNotifier, CodeModel>(
  WebsocketServiceNotifier.new,
);

class WebsocketServiceNotifier extends StateNotifier<CodeModel> {
  WebsocketServiceNotifier(this.ref) : super(CodeModel(language: 'java')) {
    final wsProvider = ref.watch(websocketProvider);
    final websocket = wsProvider.value;
    if (websocket != null && websocket.isConnected) {
      websocket.client.subscribe(
        destination: _subscribeDestination,
        callback: handleMessageFromServer,
      );
    }
  }

  static const _sendDestination = '/app/execute-ws-api-token';
  static const _subscribeDestination = '/user/queue/execute-i';

  final Ref ref;

  void sendExecuteScriptMessageToServer({
    required String script,
  }) {
    final wsProvider = ref.watch(websocketProvider);
    final websocket = wsProvider.value;
    if (websocket != null && websocket.isConnected) {
      final data = jsonEncode({
        'script': script,
        'language': state.language,
        'versionIndex': 4,
      });
      websocket.client.send(
        destination: _sendDestination,
        body: data,
        headers: {
          'message_type': 'execute',
          'token': websocket.token,
        },
      );
    }
  }

  void sendInputMessageToServer({
    required String input,
  }) {
    final wsProvider = ref.watch(websocketProvider);
    final websocket = wsProvider.value;
    if (websocket != null && websocket.isConnected) {
      websocket.client.send(
        destination: _sendDestination,
        body: input,
        headers: {'message_type': 'input'},
      );
    }
  }

  void handleMessageFromServer(StompFrame message) {
    final messageBody = message.body;
    final msgId = message.headers['message-id'];
    print('messageID: $msgId');
    if (msgId != null) {
      final msgSeq = int.parse(msgId.substring(msgId.lastIndexOf('-') + 1));
      print('message Sequence $msgSeq');
    }
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && message.body == 'Token Expired') {
        print('Token is Expired! Request new one from server...');
      }
      print('status code: $statusCode');
    }
    final allHeaders = message.headers;
    print(allHeaders);
    if (messageBody != null) {
      try {
        final decoded = jsonDecode(messageBody) as Map<String, String>;
        final message = decoded['message'];
        if (message != null) {
          print(message);
          final model = CodeModel(language: 'java')..text = message;
          state = model;
        }
      } catch (e) {
        print("messageBody ($messageBody) couldn't be decoded.");
      }
    }
  }

  // void _handleExpiredToken() {
  //   ref.read(websocketProvider.notifier).
  // }
}