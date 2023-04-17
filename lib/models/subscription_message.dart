import 'package:stomp_dart_client/stomp_frame.dart';

class SubscriptionMessage {
  SubscriptionMessage({
    required this.statusCode,
    required this.messageId,
    required this.messageSequence,
    required this.subscriptionId,
    required this.body,
  });

  SubscriptionMessage fromStompFrame(StompFrame message) {
    final headers = message.headers;
    try {
      final messageId = headers['message-id']!;
      final messageSequence =
          int.parse(messageId.substring(messageId.lastIndexOf('-') + 1));
      final subscriptionId = headers['subscription']!;

      return SubscriptionMessage(
        statusCode: statusCode,
        messageId: messageId,
        messageSequence: messageSequence,
        subscriptionId: subscriptionId,
        body: body,
      );
    } catch (e) {
      print(' error reading subscription message');
      return SubscriptionMessage(
        statusCode: statusCode,
        messageId: '',
        messageSequence: 0,
        subscriptionId: '',
        body: '',
      );
    }
  }

  final String statusCode;
  final String messageId;
  final int messageSequence;
  final String subscriptionId;
  final String body;
}

// statusCode:200
// destination:/user/queue/execute-i
// content-type:text/plain;charset=UTF-8
// subscription:sub-1681627022155-857
// message-id:1k1j3pdp-3304
// content-length:22
