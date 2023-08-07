import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modules/modules/payment/cubit/payment_cubit.dart';
import 'package:flutter_modules/modules/widgets/public_button.dart';

class PaymentToggle extends StatelessWidget {
  const PaymentToggle({super.key, required this.onKiosdSubbmeted});
  final Future<void> Function() onKiosdSubbmeted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PublicButton(
            onPressed: () {},
            title: "Card",
          ),
          const SizedBox(height: 50),
          PublicButton(
            onPressed: () {
              onKiosdSubbmeted();
            },
            title: 'Kiosk',
          ),
        ],
      )),
    );
  }
}
