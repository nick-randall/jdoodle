import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_model.dart';
import 'package:jdoodle/providers/new_web_socket_provider.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

/// Provider for the current code state
final codeProvider =
    StateNotifierProvider<CodeNotifier, CodeModel>(CodeNotifier.new);

///
class CodeNotifier extends StateNotifier<CodeModel> {
  CodeNotifier(this.ref) : super(CodeModel(language: 'java')) {
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

  void sendMessageToServer(String message) {
    final wsProvider = ref.watch(websocketProvider);
    final websocket = wsProvider.value;
    if (websocket != null && websocket.isConnected) {
      final data = jsonEncode({
        'script': message,
        'language': state.language,
        'versionIndex': 4,
      });
      websocket.client.send(
        destination: _sendDestination,
        body: data,
        headers: {'message_type': 'execute', 'token': websocket.token},
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
}
