import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/verification_successful_controller.dart';

class VerificationSuccessfulView
    extends GetView<VerificationSuccessfulController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VerificationSuccessfulView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'VerificationSuccessfulView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
