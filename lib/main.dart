// ignore_for_file: require_trailing_commas

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/providers/websocket_service_provider.dart';

void main() async {
  runApp(const ProviderScope(child: JdoodleApp()));
}

class JdoodleApp extends ConsumerWidget {
  const JdoodleApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final codeNotifier = ref.watch(websocketServiceProvider);
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
      ref
          .read(websocketServiceProvider.notifier)
          .sendExecuteScriptMessageToServer(
            script: script,
          );
    }

    void inputText(String input) {
      print(input);
      ref.read(websocketServiceProvider.notifier).sendInputMessageToServer(
            input: input,
          );
    }

    return MaterialApp(
      home: Scaffold(
          body: Column(children: [
        Text(codeNotifier.text),
        TextField(
          onChanged: inputText,
        ),
        ElevatedButton(
            onPressed: simulateSendMessage,
            child: const SizedBox(
              height: 20,
              width: 50,
              child: Text('execute code'),
            )),
      ])),
    );
  }
}
