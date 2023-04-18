import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code.dart';
import 'package:jdoodle/providers/web_socket_provider.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

import '../language.dart';

/// This service has the abstract methods for interacting with the websocket
final websocketServiceProvider = StateNotifierProvider<WebsocketServiceNotifier,
    List<void Function(StompFrame message)>>(
  WebsocketServiceNotifier.new,
);

// typedef Handler

class WebsocketServiceNotifier
    extends StateNotifier<List<void Function(StompFrame message)>> {
  WebsocketServiceNotifier(this.ref) : super([]) {
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
    required Code code,
  }) {
    final wsProvider = ref.watch(websocketProvider);
    final websocket = wsProvider.value;
    if (websocket != null && websocket.isConnected) {
      final data = jsonEncode({
        'script': code.text,
        'language': code.language,
        'versionIndex': code.language.version,
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

  void addMessageListener(void Function(StompFrame message) function) {
    state.add(function);
  }

  void removeMessageListener(void Function(StompFrame message) function) {
    state.remove(function);
  }

  void handleMessageFromServer(StompFrame message) {
    final messageBody = message.body;
    final statusCodeHeader = message.headers['statusCode'];
    if (statusCodeHeader != null) {
      final statusCode = int.parse(statusCodeHeader);
      if (statusCode == 400 && messageBody == 'Token Expired') {
        _handleExpiredToken();
      }
      if (statusCode == 204) {
        // Just a number representing time it took to calculate
      }
      print('status code: $statusCode');
    }
    print(state.length);
    for (final handler in state) {
      handler.call(message);
    }
  }

  void _handleExpiredToken() {
    print('Token is Expired! Attempting to re-establish connection');
    ref.read(websocketProvider.notifier).reestablishConnection();
  }
}
