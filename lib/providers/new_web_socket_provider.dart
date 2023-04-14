import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/websocket_model.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

const wsTokenAddress = 'https://throbbing-snowflake-655.fly.dev/';

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
    final websocketTokenUrl = Uri.parse(wsTokenAddress);
    final websocketTokenResponse = await http.post(websocketTokenUrl);
    final body =
        json.decode(websocketTokenResponse.body) as Map<String, dynamic>;
    final token = body['token'];

    if (token is String) {
      final config = StompConfig.SockJS(
        url: jdoodleApiUrl,
        onWebSocketError: (dynamic error) {
          // print(error.toString());
          final errorState = WebsocketModel.error(error: error.toString());
          state = AsyncValue.error(errorState, StackTrace.current);
        },
        onConnect: (frame) {
          print('websocket connected');
          final prevState = state.value;
          if (prevState != null) {
            state = AsyncValue.data(
              prevState.copyWith(
                isConnected: true,
              ),
            );
          }
        },
        onStompError: (error) => print('stomp error: ${error.body}'),
      );

      final client = StompClient(config: config)..activate();
      state = AsyncValue.data(
        WebsocketModel(
          client: client,
          token: token,
        ),
      );
    }
  }
}
