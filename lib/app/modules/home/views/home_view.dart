import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notify_me_app/app/data/core/utils.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    // final homeController = Get.find<HomeController>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        title: Text('Home Page'),
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              controller.authController.signOutUser();
            },
            icon: Container()),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10.0),
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'User Name : ${controller.authController.currentUserName}',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: controller.titleController,
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
                  controller: controller.messageController,
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
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                    padding: const EdgeInsets.only(right: 2, left: 2),
                    child: Obx(
                      () => DecoratedBox(
                        decoration: ShapeDecoration(
                          color: Colors.grey.shade200,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1.0,
                                // style: BorderStyle.solid,
                                color: Colors.grey.shade100),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15.0)),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 0.0),
                          child: DropdownButton(
                            underline: SizedBox(),
                            isExpanded: true,
                            hint: Text('Select a Item'),
                            value: controller.selectedRole.value,
                            items: [
                              DropdownMenuItem(
                                  value: "1", child: Text("Page-1")),
                              DropdownMenuItem(
                                  value: "2", child: Text("Page-4")),
                              DropdownMenuItem(
                                  value: "3", child: Text("Page-3")),
                              DropdownMenuItem(
                                  value: "4", child: Text("Page-4")),
                            ],
                            onChanged: (String? val) {
                              print(val);
                              controller.onSelected(val!);
                            },
                          ),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 15.0,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(minimumSize: Size(70.0, 50.0)),
                    child: Text(
                      'Submite',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                    onPressed: () async {
                      if (await Utils.checkInternetConnectivity()) {
                        controller.firestoreInstance
                            .collection("notification")
                            .add({
                          "id": "4",
                          "title": controller.titleController.text,
                          "message": controller.messageController.text,
                          "itme": controller.selectedRole.value
                          // "address": {"street": "street 24", "city": "new york"}
                        }).then((value) {
                          print(value.id);
                          //  var firebaseUser =  FirebaseAuth.instance.currentUser;
                          try {
                            controller.firestoreInstance
                                .collection("notification")
                                .doc(value.id)
                                .get()
                                .then((value) {
                              print(value.data());
                              print(value.data()!["title"]);
                              Get.toNamed(Routes.NOTIFICATION_DETAILS,
                                  arguments: {
                                    'title': value.data()!["title"],
                                    'message': value.data()!["message"],
                                    'item': value.data()!["itme"],
                                  });
                            });
                            controller.titleController.clear();
                            controller.messageController.clear();
                          } catch (e) {
                            print(e);
                          }
                        });
                        // try {
                        //   homeController.firestoreInstance
                        //       .collection("notification")
                        //       .get()
                        //       .then((querySnapshot) {
                        //     querySnapshot.docs.forEach((result) {
                        //       print(result.data());
                        //     });
                        //   });
                        // } catch (e) {
                        //   print(e);
                        // }

                      } else {
                        Get.snackbar('Error', 'Please check Internet');
                      }
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
