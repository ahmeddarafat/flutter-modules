import 'package:flutter/material.dart';
import 'package:flutter_modules/modules/push_notification/data/pn_api_service.dart';
import 'package:flutter_modules/modules/push_notification/data/pn_repository.dart';

class NFView extends StatelessWidget {
  const NFView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Push Notifications",
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              final repo = PNRepository(PNApiService());
              repo.sendMessage(
                title: "title sent",
                body: "body sent",
                token: "token",
              );
            },
            child: const Text("Send")),
      ),
    );
  }
}
