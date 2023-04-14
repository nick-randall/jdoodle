// ignore_for_file: require_trailing_commas

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/code_provider.dart';
import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

void main() async {
  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends ConsumerWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeNotifier = ref.watch(codeProvider);
    void simulateSendMessage() {
      const script = '''
import java.util.Scanner;
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
}''';
      ref.read(codeProvider.notifier).sendMessageToServer(script);
    }

    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
        Text(codeNotifier.text),
        ElevatedButton(
            onPressed: simulateSendMessage,
            child: const SizedBox(
              height: 20,
              width: 50,
              child: Text("send some code"),
            ))
      ])),
    );
  }
}
