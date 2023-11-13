
import '../homepage/homepageView2.dart';
import '../loginpage/logincontroller.dart';
import '../responsiveclass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../variables.dart';

class LoginPage extends StatelessWidget {
  LoginPage({required this.replaceTo, Key? key}) : super(key: key);

  final loginReplaceTO replaceTo;
  final LoginController _loginController = Get.put(LoginController());

  final _userRegFormKey = GlobalKey<FormState>();
  final _userLoginFormKey = GlobalKey<FormState>();

  final username = TextEditingController();
  final name = TextEditingController();
  final mobile = TextEditingController();
  final address = TextEditingController();
  final password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);

    return WillPopScope(
      onWillPop: pop,
      child: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 1,
          title: Text(
            'Login/Signup',
            style: TextStyle(

                fontSize: Responsive.safeBlockVertical * 2.50),
          ),
        ),
        body: Obx(() {
          return Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) {
                final offsetAnimation = Tween(
                  begin: const Offset(1.0, 0.0),
                  end: const Offset(0.0, 0.0),
                ).animate(animation);
                return FadeTransition(
                  opacity: animation,
                  child:
                      SlideTransition(position: offsetAnimation, child: child),
                );
              },
              child: Form(
                  key: _loginController.clickedreg.value
                      ? _userRegFormKey
                      : _userLoginFormKey,
                  child: _loginController.clickedreg.value
                      ? SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  "SIGNUP", //REGISTER
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 30),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  controller: name,
                                  cursorColor: Colors.blue,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Name",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  cursorColor: Colors.blue,
                                  maxLength: 10,
                                  // maxLengthEnforcement: MaxLengthEnforcement.none,
                                  controller: mobile,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      counterText: "",
                                      prefixIcon: Icon(
                                        Icons.mobile_friendly,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Mobile",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  cursorColor: Colors.blue,
                                  maxLength: 10,
                                  // maxLengthEnforcement: MaxLengthEnforcement.none,
                                  controller: password,
                                  // keyboardType: TextInputType.number,
                                  inputFormatters: const [
                                    // FilteringTextInputFormatter.digitsOnly,
                                    // LengthLimitingTextInputFormatter(10)
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      counterText: "",
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Password",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  cursorColor: Colors.blue,
                                  minLines: 3,
                                  maxLines: 5,
                                  controller: address,
                                  validator: (val) {
                                    if (val!.isEmpty) return "Required";
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      counterText: "",
                                      prefixIcon: Icon(
                                        Icons.location_on_rounded,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Address",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (widget, anim) {
                                  final tween = Tween<double>(begin: 0, end: 1);
                                  final opacity = tween.animate(anim);

                                  return FadeTransition(
                                    opacity: opacity,
                                    child: widget,
                                  );
                                },
                                child: _loginController.isloading.value
                                    ? const Center(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            CircularProgressIndicator(),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerRight,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: MaterialButton(
                                          onPressed: () async {
                                            if (_userRegFormKey.currentState!
                                                .validate()) {
                                              FocusManager
                                                  .instance.primaryFocus!
                                                  .unfocus();
                                              _loginController.getOtp(
                                                  name: name,
                                                  mobile: mobile,
                                                  address: address,
                                                  password: password);
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80.0)),
                                          textColor: Colors.white,
                                          padding: const EdgeInsets.all(0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45.0,
                                            width:
                                                Responsive.safeBlockHorizontal *
                                                    50,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              // gradient: String_class.gradient_orange_button
                                            ),
                                            padding: const EdgeInsets.all(0),
                                            child: const Text(
                                              "SIGNUP",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 30),
                              Visibility(
                                visible: !_loginController.isloading.value,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('Existing User?  '),
                                    GestureDetector(
                                      onTap: () {
                                        username.clear();
                                        name.clear();
                                        mobile.clear();
                                        address.clear();
                                        password.clear();
                                        _loginController.changeValue(false);
                                      },
                                      child: const Text('Login',
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                      : SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                alignment: Alignment.centerLeft,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  "LOGIN",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      fontSize: 30),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  controller: username,
                                  cursorColor: Colors.blue,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                    LengthLimitingTextInputFormatter(10)
                                  ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.mobile_friendly,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Mobile",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: TextFormField(
                                  controller: password, obscureText: true,
                                  cursorColor: Colors.blue,
                                  // keyboardType: TextInputType.number,
                                  // inputFormatters: [
                                  //   FilteringTextInputFormatter.digitsOnly,
                                  //   LengthLimitingTextInputFormatter(10)
                                  // ],
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Required";
                                    }
                                    return null;
                                  },
                                  decoration: const InputDecoration(
                                      focusedBorder: UnderlineInputBorder(),
                                      prefixIcon: Icon(
                                        Icons.lock,
                                        color: Colors.blue,
                                      ),
                                      labelText: "Password",
                                      // labelText: "Password",
                                      labelStyle:
                                          TextStyle(color: Colors.blue)),
                                ),
                              ),
                              AnimatedSwitcher(
                                duration: const Duration(milliseconds: 500),
                                transitionBuilder: (widget, anim) {
                                  final tween = Tween<double>(begin: 0, end: 1);
                                  final opacity = tween.animate(anim);

                                  return FadeTransition(
                                    opacity: opacity,
                                    child: widget,
                                  );
                                },
                                child: _loginController.isloading.value
                                    ? const Center(
                                        child: Column(
                                          children: [
                                            SizedBox(height: 20),
                                            CircularProgressIndicator(),
                                          ],
                                        ),
                                      )
                                    : Container(
                                        alignment: Alignment.centerRight,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: MaterialButton(
                                          onPressed: () async {
                                            if (_userLoginFormKey.currentState!
                                                .validate()) {
                                              FocusManager
                                                  .instance.primaryFocus!
                                                  .unfocus();
                                              _loginController.login(
                                                  user: username.text,
                                                  password: password.text,
                                                  replaceTO: replaceTo);
                                            }
                                          },
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(80.0)),
                                          textColor: Colors.white,
                                          padding: const EdgeInsets.all(0),
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 45.0,
                                            width:
                                                Responsive.safeBlockHorizontal *
                                                    50,
                                            decoration: BoxDecoration(
                                              color: Colors.blue,
                                              borderRadius:
                                                  BorderRadius.circular(80.0),
                                              // gradient: String_class.gradient_orange_button
                                            ),
                                            padding: const EdgeInsets.all(0),
                                            child: const Text(
                                              "LOGIN",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ),
                              ),
                              const SizedBox(height: 30),

                              Visibility(
                                visible: !_loginController.isloading.value,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text('New User?  '),
                                    GestureDetector(
                                      onTap: () {
                                        username.clear();
                                        name.clear();
                                        mobile.clear();
                                        address.clear();
                                        password.clear();
                                        _loginController.changeValue(true);
                                        // });
                                      },
                                      child: const Text(
                                        'Register now',
                                        style: TextStyle(
                                            color: Colors.blue,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        )),
            ),
          );
        }),
      ),
    );
  }

  Future<bool> pop() async {
    if (replaceTo == loginReplaceTO.profile) {
      Get.offAll(HomePage2());
      return true;
    }

    return true;
  }
}
