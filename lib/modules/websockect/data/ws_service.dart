import 'package:web_socket_channel/web_socket_channel.dart';

class WSService {
  final wsUrl = Uri.parse('wss://echo.websocket.events');
  late final WebSocketChannel channel;

  void connect() {
    channel = WebSocketChannel.connect(wsUrl);
  }

  void send(String data) {
    channel.sink.add(data);
  }

  void close() {
    channel.sink.close();
  }
}
