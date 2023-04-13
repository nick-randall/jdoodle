import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';

const clientId = "f24fcb9aa1f0a602f3f645ff314c52a5";
const clientSecret =
    "ac75b0835426cec3ce1b2daf982d873c00d334fdc699ee8bcc6d56b909f9e0d2";
const wsTokenUrl = "https://api.jdoodle.com/v1/auth-token";

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

  StreamedResponse response = await request.send();

  if (response.statusCode == 200) {
    print(await response.stream.bytesToString());
  } else {
    print(response.reasonPhrase);
  }
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
