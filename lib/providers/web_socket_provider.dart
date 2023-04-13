import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/code_model.dart';

const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
const clientSecret =
    "af8fc15e85d33fd1f704f2f322cd9fcb3effbce9ee641c5fc767f47b975cc4f4";
const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";

final websocketProvider = StreamProvider<CodeModel>((ref) async* {
  final urlWs = Uri.parse(wsTokenUrl);
  final channel = WebSocketChannel.connect(urlWs);
  yield CodeModel();
});

final channelProvider =
    FutureProvider.autoDispose<WebSocketChannel>((ref) async {
  final wsTokenEndpoint = Uri.parse('$wsTokenUrl$clientId$clientSecret');
  const data = '{"clientId":"$clientId","clientSecret":"$clientSecret}';
  // final request = HttpRequest.request(wsTokenUrl, method: "POST",sendData: data);
  // request.open("POST", wsTokenUrl);
  final response = await http.get(wsTokenEndpoint);
  print(response.body);
  print('channelProvider');
  final wsUrl = Uri.parse(response.body);
  return WebSocketChannel.connect(Uri.parse("response.body"));
});

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
