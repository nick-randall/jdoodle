import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_model.dart';
import 'package:jdoodle/providers/new_web_socket_provider.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

/// Provider for the current code state
final codeProvider = Provider(CodeNotifier.new);

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

  void handleMessageFromServer(StompFrame stompFrame) {
    final frameBody = stompFrame.body;

    if (frameBody != null) {
      final decoded = jsonDecode(frameBody) as Map<String, String>;
      final message = decoded['message'];
      if (message != null) {
        print(message);
        final model = CodeModel(language: 'java')..text = message;
        state = model;
      }
    }
  }
}
