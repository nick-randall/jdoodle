import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:jdoodle/providers/websocket_model.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

const websocketTokenAddress = 'https://throbbing-snowflake-655.fly.dev/';

/// Responsible for acquiring the websocket token and initiating the websocket
/// connection.

class WebsocketService {
  factory WebsocketService() {
    return _singleton;
  }
  WebsocketService._internal() {
    connectWebsocket();
  }
  static const _subscribeDestination = '/user/queue/execute-i';

  static final _singleton = WebsocketService._internal();

  StreamController<StompFrame> streamController =
      StreamController.broadcast(sync: true);

  WebsocketModel websocket = WebsocketModel.initial();

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

      websocket = WebsocketModel(
        client: client,
        token: websocketToken,
        isConnected: true,
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
    websocket = WebsocketModel.initial();
    websocket.client.deactivate();
  }

  void disconnect() {
    final websocket = WebsocketModel.initial().copyWith(
      reconnectOnDisconnect: false,
    );
    websocket.client.deactivate();
  }

  void _handleWebsocketConnected(StompFrame frame) {
    print('websocket connected');
    // This callback fires after WebsocketModel already initialised.
    // Just need to change isConnected to true so clients are allowed to use it.
    websocket.client.subscribe(
      destination: _subscribeDestination,
      callback: (frame) {
        streamController.add(frame);
      },
    );
    websocket.isConnected = true;
  }

  void _handleWebsocketDisconnected() {
    websocket = WebsocketModel.initial();
    if (websocket.reconnectOnDisconnect) {
      websocket = WebsocketModel.initial();
      connectWebsocket();
    }
    // else {
    //   dispose();
    // }
  }

  void _handleWebsocketError(dynamic error) {
    websocket = WebsocketModel.error(error: error.toString());
  }
}
