import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import 'payment_configuration.dart';

class GoogleManualPaymentHandlingScreen extends StatefulWidget {
  const GoogleManualPaymentHandlingScreen({super.key});

  @override
  State<GoogleManualPaymentHandlingScreen> createState() =>
      _GoogleManualPaymentHandlingScreenState();
}

class _GoogleManualPaymentHandlingScreenState
    extends State<GoogleManualPaymentHandlingScreen> {
  late Pay payClient;

  @override
  void initState() {
    payClient = Pay({
      PayProvider.google_pay:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text("Manual payment handling"),
          backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Visibility(
          visible: Platform.isAndroid,
          child: FutureBuilder(
            future: payClient.userCanPay(PayProvider.google_pay),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.data == true) {
                  return ElevatedButton(
                    onPressed: () async {
                      final result = await payClient.showPaymentSelector(
                        PayProvider.google_pay,
                        [
                          const PaymentItem(
                            amount: '50.00',
                            status: PaymentItemStatus.final_price,
                          )
                        ],
                      );
                      log(result.toString());
                    },
                    child: const Text(
                      'Pay with GPay',
                    ),
                  );
                } else {
                  // userCanPay returned false
                  // Consider showing an alternative payment method
                }
              }
              return Container(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
