import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      20.0,
                    ))),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                maxLines: 7,
                minLines: 5,
                decoration: InputDecoration(
                    hintText: 'Message',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                      20.0,
                    ))),
              ),
              SizedBox(
                height: 10.0,
              ),
                
            ],
          ),
        ),
      ),
    );
  }
}
