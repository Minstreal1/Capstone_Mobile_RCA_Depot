import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/payment_detail_controller.dart';

class PaymentDetailView extends GetView<PaymentDetailController> {
  const PaymentDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaymentDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PaymentDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
