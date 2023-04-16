import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jdoodle/providers/websocket_model.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

const websocketTokenAddress = 'https://throbbing-snowflake-655.fly.dev/';

/// Responsible for acquiring the websocket token and initiating the websocket
/// connection.
final websocketProvider =
    StateNotifierProvider<WebsocketProvider, AsyncValue<WebsocketModel>>(
  (ref) => WebsocketProvider(),
);

class WebsocketProvider extends StateNotifier<AsyncValue<WebsocketModel>> {
  WebsocketProvider() : super(AsyncValue.data(WebsocketModel.initial())) {
    connectWebsocket();
  }

  static const jdoodleApiUrl = 'https://api.jdoodle.com/v1/stomp';

  Future<void> connectWebsocket() async {
    final websocketToken = await _fetchWebsocketToken();
    if (websocketToken != null) {
      final config = StompConfig.SockJS(
        url: jdoodleApiUrl,
        onWebSocketError: _handleWebsocketError,
        onConnect: _handleWebsocketConnected,
        onWebSocketDone: _handleWebsocketDisconnected,
        onStompError: (error) => print('stomp error: ${error.body}'),
      );

      final client = StompClient(config: config)..activate();
      state = AsyncValue.data(
        WebsocketModel(
          client: client,
          token: websocketToken,
        ),
      );
    }
  }

  Future<String?> _fetchWebsocketToken() async {
    final websocketTokenUrl = Uri.parse(websocketTokenAddress);
    try {
      final websocketTokenResponse = await http.post(websocketTokenUrl);
      final body =
          json.decode(websocketTokenResponse.body) as Map<String, dynamic>;
      final token = body['token'];
      if (token is String) {
        print(token);
        return token;
      } else {
        throw 'Error getting token';
      }
    } catch (e) {
      print('Error getting token');
    }
    return null;
  }

  void reestablishConnection() {
    final websocket = state.value;
    if (websocket != null) {
      state = AsyncValue.data(WebsocketModel.initial());
      websocket.client.deactivate();
    }
  }

  void disconnect() {
    final websocket = state.value;
    if (websocket != null) {
      state = AsyncValue.data(
        WebsocketModel.initial().copyWith(
          reconnectOnDisconnect: false,
        ),
      );
      websocket.client.deactivate();
    }
  }

  void _handleWebsocketConnected(StompFrame frame) {
    print('websocket connected');
    // This callback fires after WebsocketModel already initialised.
    // Just need to change isConnected to true so clients are allowed to use it.
    final prevState = state.value;
    if (prevState != null) {
      state = AsyncValue.data(
        prevState.copyWith(
          isConnected: true,
        ),
      );
    }
  }

  void _handleWebsocketDisconnected() {
    state = AsyncValue.data(WebsocketModel.initial());
    final websocket = state.value;
    if (websocket != null && websocket.reconnectOnDisconnect) {
      state = AsyncValue.data(WebsocketModel.initial());
      connectWebsocket();
    } else {
      dispose();
    }
  }

  void _handleWebsocketError(dynamic error) {
    final errorState = WebsocketModel.error(error: error.toString());
    state = AsyncValue.error(errorState, StackTrace.current);
  }
}
