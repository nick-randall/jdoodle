import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

void main() async {
  runApp(const ProviderScope(child: JdoodleApp()));

  final data = jsonEncode({
    "script": script,
    "language": "java",
    "versionIndex": 4,
  });
  const httpswsu = "https://api.jdoodle.com/v1/stomp";

  final config = StompConfig.SockJS(
      url: httpswsu,
      beforeConnect: () async {
        print('waiting to connect...');
        await Future.delayed(const Duration(milliseconds: 200));
        print('connecting...');
      },
      onWebSocketError: (dynamic error) => print(error.toString()),
      onConnect: (frame) => print(
          "body: ${frame.body} headers: ${frame.headers} command: ${frame.command}"),
      onStompError: (p1) => print(p1.body));
  StompClient client = StompClient(config: config);

  client.activate();
  await Future.delayed(const Duration(seconds: 2));
  print(client.connected);

  void send() => client.send(
      destination: '/app/execute-ws-api-token',
      body: data,
      headers: {"message_type": 'execute', "token": token});

  client.subscribe(
      destination: '/user/queue/execute-i',
      callback: (frame) {
        print("subscribe callback");
        print(
            "body: ${frame.body} headers: ${frame.headers} command: ${frame.command}");
      },
      headers: {"token": token});
  await Future.delayed(const Duration(seconds: 2));

  send();
  await Future.delayed(const Duration(seconds: 2));
  send();

  // print(client.connected);
  // final io = IO.io(wsu);

  // io.onConnect((data) => print("connected"));
  // io.onConnectError((data) => print("connect error $data"));
  // final ws = WebSocketChannel.connect(Uri.parse(wsu));
  // ws.sink.add("let x = 0;");
  // // ws.stream.listen((event) => print(event));
  // ws.stream.listen((event) => print("event $event ${event.runtimeType}"));
  // } else {
  //   print(response.reasonPhrase);
  // }
}

class JdoodleApp extends StatelessWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
          body: Center(
        child: Text("Splash screen"),
      )),
    );
  }
}
