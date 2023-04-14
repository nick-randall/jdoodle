import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
const clientSecret =
    "ac75b0835426cec3ce1b2daf982d873c00d334fdc699ee8bcc6d56b909f9e0d2";
const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";
// const wsUrl = "wss://api.jdoodle.com/";
const wsUrl = "wss://api.jdoodle.com/v1/stomp/792";

void main() async {
  runApp(const ProviderScope(child: JdoodleApp()));
  const headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
  final data =
      jsonEncode("{'clientId': '$clientId','clientSecret': '$clientSecret'}");
  var request = Request('POST', Uri.parse(wsTokenUrl));
  request.body = data;
  request.headers.addAll(headers);

  // StreamedResponse response = await request.send();

  // if (response.statusCode == 200) {
  // final token = await response.stream.bytesToString();
  // print(token);
  // final wsUri = Uri.parse("$wsUrl/$token/websocket");
  const wsu = "wss://api.jdoodle.com/v1/stomp";
  const httpswsu = "https://api.jdoodle.com/v1/stomp";
  // const wsu = "wss://api.jdoodle.com/v1/stomp/792/bkoj3ije/websocket";

  final config = StompConfig.SockJS(
      url: httpswsu,
      beforeConnect: () async {
        print('waiting to connect...');
        await Future.delayed(const Duration(milliseconds: 200));
        print('connecting...');
      },
      onWebSocketError: (dynamic error) => print(error.toString()),
      onConnect: (p0) => print(p0.headers),
      onStompError: (p1) => print(p1.body));
  StompClient client = StompClient(config: config);
  // StompClient client = StompClient(
  //     config: StompConfig(
  //   url: httpswsu,
  //   onConnect: (event) => print(event),
  //   onWebSocketError: (dynamic error) => print(error.toString()),
  //   stompConnectHeaders: {
  //     token:
  //         "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKRE9PRExFIiwic3ViIjoiV1MtQVBJLVRPS0VOIiwiY2xpZW50LWlkIjoiODk0ZGVhYmQ1ZGYwZDBmZGE0NmZjZDI5NGM0ZTZmNmEiLCJpYXQiOjE2Nzg4ODQ0MDYsImV4cCI6MTY3ODg4NDU4Nn0.Vp2rqQ9HQxtxq1XcuQtWSkmHA21GiJbZltNs49zqlAs"
  //   },
  //   beforeConnect: () async {
  //     print('waiting to connect...');
  //     await Future.delayed(Duration(milliseconds: 200));
  //     print('connecting...');
  //   },
  // ));
  client.activate();
  await Future.delayed(const Duration(seconds: 2));
  print(client.connected);

  void send() => client.send(
          destination: '/app/execute-ws-api-token',
          body: "hello world",
          headers: {
            "message_type": 'execute',
            "token":
                "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKRE9PRExFIiwic3ViIjoiV1MtQVBJLVRPS0VOIiwiY2xpZW50LWlkIjoiZjI0ZmNiOWFhMWYwYTYwMmYzZjY0NWZmMzE0YzUyYTUiLCJpYXQiOjE2ODE0MjcyODUsImV4cCI6MTY4MTQyNzQ2NX0.pBS3Lg3WWkh3AWplmwjsVMhqQlPP8LvUIQ3q1wwndbs"
          });

  client.subscribe(
      destination: '/user/queue/execute-i',
      callback: (frame) {
        print("subscribe callback");
        print("${frame.body} ${frame.headers}");
      },
      headers: {
        "token":
            "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKRE9PRExFIiwic3ViIjoiV1MtQVBJLVRPS0VOIiwiY2xpZW50LWlkIjoiZjI0ZmNiOWFhMWYwYTYwMmYzZjY0NWZmMzE0YzUyYTUiLCJpYXQiOjE2ODE0MjcyODUsImV4cCI6MTY4MTQyNzQ2NX0.pBS3Lg3WWkh3AWplmwjsVMhqQlPP8LvUIQ3q1wwndbs" // "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJKRE9PRExFIiwic3ViIjoiV1MtQVBJLVRPS0VOIiwiY2xpZW50LWlkIjoiODk0ZGVhYmQ1ZGYwZDBmZGE0NmZjZDI5NGM0ZTZmNmEiLCJpYXQiOjE2Nzg4ODQ0MDYsImV4cCI6MTY3ODg4NDU4Nn0.Vp2rqQ9HQxtxq1XcuQtWSkmHA21GiJbZltNs49zqlAs"
      });
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
