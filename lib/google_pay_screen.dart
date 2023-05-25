import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class GooglePayScreen extends StatelessWidget {
  GooglePayScreen({super.key});
  final Future<PaymentConfiguration> _googlePayConfigFuture =
      PaymentConfiguration.fromAsset('gpay.json');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            title: const Text("Gpay Inbuild Widget"),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary),
        body: Center(
            child: FutureBuilder<PaymentConfiguration>(
                future: _googlePayConfigFuture,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GooglePayButton(
                      paymentConfiguration: snapshot.data!,
                      paymentItems: const [
                        PaymentItem(
                          label: 'Total',
                          amount: '10.00',
                          status: PaymentItemStatus.final_price,
                        )
                      ],
                      type: GooglePayButtonType.pay,
                      margin: const EdgeInsets.only(top: 15.0),
                      onError: (error) {
                        log(error.toString());
                      },
                      onPaymentResult: (result) {
                        log(result.toString());
                      },
                      childOnError: Text("Error akjdsfnkjsfd skjdfkj"),
                      loadingIndicator: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                })));
  }
}
