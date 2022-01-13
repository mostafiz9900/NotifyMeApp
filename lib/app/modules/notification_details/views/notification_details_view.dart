import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notification_details_controller.dart';

class NotificationDetailsView extends GetView<NotificationDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NotificationDetailsView'),
        centerTitle: true,
      ),
      body: Obx(() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${controller.title.toString()}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 50.0,),
                  Text(
                    '${controller.message}',
                    style: TextStyle(fontSize: 20),
                  ),
                   SizedBox(height: 30.0,),
                  Text(
                    '${controller.item}',
                    style: TextStyle(fontSize: 60,fontWeight: FontWeight.bold),
                  ),
                ],
              ),
        ),
      )),
    );
  }
}
