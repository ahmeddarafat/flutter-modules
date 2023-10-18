import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/websockect/data/ws_service.dart';

class WSPage extends StatefulWidget {
  const WSPage({super.key});

  @override
  State<WSPage> createState() => _WSPageState();
}

class _WSPageState extends State<WSPage> {
  late final TextEditingController textController;
  final wsService = WSService();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    wsService.connect();
  }

  @override
  void dispose() {
    textController.dispose();
    wsService.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Web Socket Demo")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: textController,
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  wsService.send(textController.text);
                },
                child: const Text("Send")),
            const SizedBox(height: 30),
            StreamBuilder(
              stream: wsService.channel.stream,
              builder: (_, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return const Text("there is an error");
                } else if (snapshot.hasData) {
                  final data = snapshot.data;
                  return Text("$data");
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
