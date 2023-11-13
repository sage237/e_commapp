
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled1/profile/profileView.dart';

import '../checkoutpage/checkoutpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../profile/profileController.dart';
import '../variables.dart';

class LoginController extends GetxController {
  RxBool clickedreg = false.obs;
  RxBool isloading = false.obs;
  final ProfileController profileController = Get.find();
  void changeValue(bool value) {
    clickedreg.value = value;
  }

  void login(
      {required String user,
      required String password,
      required loginReplaceTO replaceTO}) async {




    isloading.value = true;

    try { CollectionReference cats= FirebaseFirestore.instance.collection('users');

    final data =await cats.get();

    if(data.docs.isNotEmpty) {
        for (var element in data.docs) {

// log('$user $password Element ${element['mobile']} ${element['password']}');
            if('${element['mobile']}'==user&&'${element['password']}'==password) {
              var sp = await SharedPreferences.getInstance();
              sp.setBool('logged', true);
              sp.setString('memberid', element['userid']);
              sp.setString('membername', '${element['name']}');
               sp.setString('username', user);
              sp.setString('pwrd', password);
              profileController.getProfileDetails();

              switch (replaceTO) {
                case loginReplaceTO.profile:
                  Get.offAll(() => ProfilePage(

                  ));
                  break;

                case loginReplaceTO.checkout:
                  Get.off(() => CheckOutPage());
                  break;



                case loginReplaceTO.hotdeals:
                // TODO: Handle this case.
                case loginReplaceTO.coupons:
                // TODO: Handle this case.
              }return; }
            else {
              Get.dialog(AlertDialog(
                alignment: Alignment.center,
                content: const Text(
                  "Invalid User or password",
                  style: TextStyle(color: Colors.red),
                ),
                actions: [
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text("Ok")),
                  )
                ],
              )); }

        }
      } else {
        Get.snackbar('Error', 'Something went wrong,please try again',
            snackPosition: SnackPosition.BOTTOM);
      }



    } catch (e) {
      Get.snackbar(
        "Error",
        "$e",
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isloading.value = false;
    }
  }

  void getOtp(
      {required TextEditingController name,
      required TextEditingController mobile,
      required TextEditingController password,
      required TextEditingController address}) async {
    final formKey1 = GlobalKey<FormState>();
    final otpController = TextEditingController();
    bool visible1 = false;

    var data = {'action': 'GetOTP', 'MobileNo': mobile.text};
    isloading(true);
    // log('Name $name $mobile $password $address');
    try {

      if (true) {
        Get.dialog(StatefulBuilder(builder: (context, setState) {
          return AlertDialog(
            title: const Text('Enter OTP'),
            actions: <Widget>[
              Form(
                  key: formKey1,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    Container(
                        width: 280,
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter Otp!';
                            }
                            if (value != '1234') return "Wrong OTP";
                            return null;
                          },
                          controller: otpController,
                          autocorrect: true,
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.person),
                              isDense: true,
                              fillColor: Colors.grey[200],
                              filled: true,
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(00.0),
                                ),
                              ),
                              hintStyle: const TextStyle(color: Colors.black),
                              hintText: 'Enter OTP'),
                        )),
                    Visibility(
                        visible: visible1,
                        child: Container(
                            margin: const EdgeInsets.only(bottom: 30),
                            child: const CircularProgressIndicator())),
                    TextButton(
                        child: const Text("OK"),
                        onPressed: () {
                          final isValid1 = formKey1.currentState!.validate();

                          if (isValid1) {
                            setState(() {
                              otpController.clear();
                              isloading.value = false;
                              register(
                                  name: name,
                                  mobile: mobile,
                                  password: password,
                                  address: address);
                              Navigator.of(context).pop();
                            });
                          }
                        }),
                    TextButton(
                        child: const Text("Cancel"),
                        onPressed: () {
                          setState(() {
                            otpController.clear();
                            isloading(false);
                          });
                          Navigator.of(context).pop();
                        }),
                  ]))
            ],
          );
        }));
      } else {
        Get.snackbar('Error', '',
            snackPosition: SnackPosition.BOTTOM);
        isloading(false);
      }
    } catch (e) {
      Get.snackbar('Something went wrong', 'Please try again',
          snackPosition: SnackPosition.BOTTOM);
      isloading(false);
    } finally {}
  }

  void register(
      {required TextEditingController name,
      required TextEditingController mobile,
      required TextEditingController password,
      required TextEditingController address}) async {
    var data = {
      'action': 'NewRegister',
      'Name': name.text,
      'Mobile': mobile.text,
      'Password': password.text,
      'Address': address.text,
    };
    try {

      if (true) {
        Get.snackbar('Success', 'Sign up successful,please login',
            snackPosition: SnackPosition.BOTTOM);
        name.clear();
        mobile.clear();
        password.clear();
        address.clear();

        clickedreg(false);
      } else {
        Get.snackbar('Error', 'error',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('Something went wrong', 'Please try again',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isloading(false);
    }
  }
}
