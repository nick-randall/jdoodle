import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jdoodle/models/code_execution_state.dart';
import 'package:jdoodle/providers/websocket_service_provider.dart';
import 'package:stomp_dart_client/stomp_frame.dart';

final codeExecutionProvider = StateNotifierProvider<CodeExecutionNotifier,
    AsyncValue<CodeExecutionState>>(
  CodeExecutionNotifier.new,
);

class CodeExecutionNotifier
    extends StateNotifier<AsyncValue<CodeExecutionState>> {
  CodeExecutionNotifier(this.ref) : super(const AsyncValue.loading()) {
    ref
        .read(
          websocketServiceProvider.notifier,
        )
        .addMessageListener(_handleMessageFromServer);
  }
  final Ref ref;

  void _handleMessageFromServer(StompFrame message) {
    print("called");
  }
}
