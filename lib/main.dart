import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

const wsTokenAddress = "https://throbbing-snowflake-655.fly.dev/";
const wsUrl = "wss://api.jdoodle.com/v1/stomp/792";

const script = """ import java.util.Scanner;
 import java.util.NoSuchElementException;

public class MyClass {
 public static void main(String args[]) {
		Scanner scanner = new Scanner(System.in);

		try {
		 System.out.println("Type a Line and enter....");
		String txt = scanner.nextLine();
		System.out.println("You have typed...");
		System.out.println(txt);
		} catch (NoSuchElementException e) {
		    System.out.println("Type something in the Stdin box above....");
		}

	}
  }""";

void main() async {
  runApp(const ProviderScope(child: JdoodleApp()));

  final wsTokenUrl = Uri.parse(wsTokenAddress);
  final response = await http.post(wsTokenUrl);
  final body = json.decode(response.body);
  String token = body["token"];
  final data = jsonEncode({
    "script": script,
    "language": "java",
    "versionIndex": 4,
  });
  print(token);
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
      onConnect: (frame) => print(
          "body: ${frame.body} headers: ${frame.headers} command: ${frame.command}"),
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
