import 'package:stomp_dart_client/stomp.dart';
import 'package:stomp_dart_client/stomp_config.dart';

class WebsocketModel {
  WebsocketModel({
    required this.client,
    required this.token,
    this.error,
    this.isConnected = false,
    this.reconnectOnDisconnect = true,
  });
  WebsocketModel.initial()
      : isConnected = false,
        token = '',
        client = StompClient(config: const StompConfig(url: '')),
        reconnectOnDisconnect = true;
  WebsocketModel.error({required this.error})
      : token = '',
        isConnected = false,
        client = StompClient(config: const StompConfig(url: '')),
        reconnectOnDisconnect = true;

  bool isConnected;
  String token;
  StompClient client;
  String? error;
  bool reconnectOnDisconnect;

  WebsocketModel copyWith({
    StompClient? client,
    String? token,
    bool? isConnected,
    String? error,
    bool? reconnectOnDisconnect,
  }) {
    return WebsocketModel(
        client: client ?? this.client,
        token: token ?? this.token,
        error: error ?? this.error,
        isConnected: isConnected ?? this.isConnected,
        reconnectOnDisconnect:
            reconnectOnDisconnect ?? this.reconnectOnDisconnect);
  }
}

class WebsocketState {}

class WebsocketLoading {}

class WebsocketError {}
