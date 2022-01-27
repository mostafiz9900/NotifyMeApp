import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:notify_me_app/app/data/core/utils.dart';
import 'package:notify_me_app/app/routes/app_pages.dart';

import '../controllers/signin_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SigninView extends GetView<SigninController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SigninView'),
        centerTitle: true,
      ),
      body: LoginScreen(),
    );
  }
}

//code for designing the UI of our text field where the user writes his email id or password

const kTextFieldDecoration = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Colors.grey),
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

final _auth = FirebaseAuth.instance;

class _LoginScreenState extends State<LoginScreen> {
  String? email;
  String? password;
  bool showSpinner = false;
  final loginCotroller = Get.find<SigninController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                TextField(
                    keyboardType: TextInputType.emailAddress,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      email = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                      hintText: 'Enter your email',
                    )),
                SizedBox(
                  height: 8.0,
                ),
                TextField(
                    obscureText: true,
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      password = value;
                      //Do something with the user input.
                    },
                    decoration: kTextFieldDecoration.copyWith(
                        hintText: 'Enter your password.')),
                SizedBox(
                  height: 24.0,
                ),
                ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(minimumSize: Size(70.0, 50.0)),
                    child: Text(
                      'Log In',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                    ),
                    onPressed: () async {
                      if (await Utils.checkInternetConnectivity()) {
// setState(() {
                        //   showSpinner = true;
                        // });
                        try {
                          await _auth
                              .signInWithEmailAndPassword(
                                  email: email!, password: password!)
                              .then((value) async {
                            print(value);
                            print('==============');
                            print(value.user!.uid);
                            var collection =
                                FirebaseFirestore.instance.collection('users');
                            var querySnapshot = await collection.get();
                            for (var queryDocumentSnapshot
                                in querySnapshot.docs) {
                              Map<String, dynamic> data =
                                  queryDocumentSnapshot.data();
                              var userId = data['user_id'];
                              var userName = data['user_name'];
                              var email = data['user_email'];
                              print(email);
                              print('----=====');
                              print(value.user!.email);
                              if (email == value.user!.email) {
                                loginCotroller.authController
                                    .setCurrentUser(userName: userName);
                                Get.offAndToNamed(Routes.HOME);
                              }
                            }

                            /*     try {
                              loginCotroller.firestoreInstance
                                  .collection("users")
                                  .doc(value.user!.uid)
                                  .get()
                                  .then((value) {
                                print(value.data());
                                print('ekhane');
                                // print(value.data()!["user_id"]);
                                // Get.toNamed(Routes.VERIFICATION_SUCCESSFUL);
                                // authController.setCurrentUser(
                                // userName: value.data()!["user_name"]);
                                // Get.offAllNamed(Routes.HOME, arguments: {
                                //   'user_id': value.data()!["user_id"],
                                //   'user_email': value.data()!["user_email"],
                                //   'user_name': value.data()!["user_name"],
                                // });
                              });
                            } catch (e) {
                              print(e);
                            } */
                          });
                          // print(user);
                          // if (user != null) {
                          //   Get.toNamed(Routes.HOME);

                          // }
                        } on FirebaseAuthException catch (e) {
                          print(e.code.toString());
                          print('ekhane');
                          // Get.snackbar('Error', '${e.code}');
                          switch (e.code) {
                            case "user-not-found":
                              Get.snackbar('Error', "This Email ID Not Found.");
                              break;
                            case 'wrong-password':
                              Get.snackbar('Error', "This Password is wrong");
                              break;
                          }
                        }
                        // setState(() {
                        //   showSpinner = false;
                        // });
                      } else {
                        Get.snackbar('Error', 'Please check Internet');
                      }
                    }),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Do not have an account?"),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      ),
                    ),
                  ],
                ),
                // ElevatedButton(
                //     onPressed: () {
                //       Get.toNamed(Routes.VERIFICATION);
                //     },
                //     child: Text('webView'))
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routes.PHONE_SIGNIN);
                    },
                    child: Text('Phone signin'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
