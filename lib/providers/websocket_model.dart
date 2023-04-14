import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class WebsocketModel {
  WebsocketModel(
      {required this.client,
      required this.token,
      this.error,
      this.isConnected = false});
  WebsocketModel.initial()
      : isConnected = false,
        token = '',
        client = StompClient(config: const StompConfig(url: ''));
  WebsocketModel.error({required this.error})
      : token = '',
        isConnected = false,
        client = StompClient(config: const StompConfig(url: ''));

  bool isConnected;
  String token;
  StompClient client;
  String? error;

  WebsocketModel copyWith(
      {StompClient? client, String? token, bool? isConnected, String? error}) {
    return WebsocketModel(
        client: client ?? this.client,
        token: token ?? this.token,
        error: error ?? this.error,
        isConnected: isConnected ?? this.isConnected);
  }
}

class WebsocketState {}

class WebsocketLoading {}

class WebsocketError {}
