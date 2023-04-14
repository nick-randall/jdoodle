import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:jdoodle/providers/websocket_model.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

const _wsTokenAddress = 'https://throbbing-snowflake-655.fly.dev/';

/// Provides the websocket instance as a stream
final websocketProvider = StreamProvider<WebsocketModel>((ref) async* {
  var websocket = WebsocketModel.initial();
  final wsTokenUrl = Uri.parse(_wsTokenAddress);
  final response = await http.post(wsTokenUrl);
  final body = json.decode(response.body) as Map<String, String>;
  final token = body['token'];

  if (token != null) {
    const jdoodleApiUrl = 'https://api.jdoodle.com/v1/stomp';
    final config = StompConfig.SockJS(
        url: jdoodleApiUrl,
        onWebSocketError: (dynamic error) {
          print(error.toString());
          websocket = WebsocketModel.error(error: error.toString());
        },
        onConnect: (frame) => print("websocket connected"),
        onStompError: (error) => print("stomp error: ${error.body}"));
    final client = StompClient(config: config);

    if (websocket.error == null) {
      websocket =
          WebsocketModel(client: client, token: token, isConnected: true);
    }
  }
  yield websocket;
});

// final stream = websocketProvider.addListener(node, (previous, next) {},
//     onError: onError,
//     onDependencyMayHaveChanged: onDependencyMayHaveChanged,
//     fireImmediately: fireImmediately);
// final stream2 = websocketProvider.select((value) => value);

// final channelProvider =
//     FutureProvider.autoDispose<WebSocketChannel>((ref) async {
//   final wsTokenEndpoint = Uri.parse('$wsTokenUrl$clientId$clientSecret');
//   const data = '{"clientId":"$clientId","clientSecret":"$clientSecret}';
//   // final request = HttpRequest.request(wsTokenUrl, method: "POST",sendData: data);
//   // request.open("POST", wsTokenUrl);
//   final response = await http.get(wsTokenEndpoint);
//   print(response.body);
//   print('channelProvider');
//   final wsUrl = Uri.parse(response.body);
//   return WebSocketChannel.connect(Uri.parse("response.body"));
// });

// final streamProvider = StreamProvider.autoDispose<dynamic>((ref) {
//   print('streamProvider | Metrics - socket opened');
//   var stream = ref.watch(channelProvider).stream;

//   var isSubControlError = false;

//   final sub = stream.listen(
//     (data) {
//       ref.watch(channelProvider).sink?.add('> sink add ${httpParam.path}');
//     },
//     onError: (_, stack) => null,
//     onDone: () async {
//       isSubControlError = true;
//       await Future.delayed(const Duration(seconds: 10));
//       ref.container.refresh(channelProvider);
//     },
//   );

//   ref.onDispose(() {
//     print('streamProvider | Metrics - socket closed');
//     sub.cancel();
//     if (!isSubControlError) {
//       ref.watch(channelProvider).sink.close(1001);
//     }
//     stream = null;
//   });

//   return stream;
// });
