import 'package:flutter/material.dart';
import 'package:google_pay_poc_app/google_manual_payment_handling_screen.dart';
import 'package:google_pay_poc_app/google_pay_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("GPay POC App"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return GooglePayScreen();
                    },
                  ));
                },
                child: const Text("Google Inbuild GPay Button")),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const GoogleManualPaymentHandlingScreen();
                    },
                  ));
                },
                child: const Text("Manual Payment Handling")),
          ],
        )));
  }
}
