import 'dart:io';

import '../profile/profileController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../responsiveclass.dart';

class ViewEditProfile extends StatelessWidget {
  ViewEditProfile({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.find();
  final form_key = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _whatsappController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  final TextEditingController _compController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _mapurlController = TextEditingController();
  final TextEditingController _altnumController = TextEditingController();

  final TextEditingController _websiteController = TextEditingController();
  final TextEditingController _facebookController = TextEditingController();
  final TextEditingController _instaController = TextEditingController();
  final TextEditingController _twitterController = TextEditingController();
  final TextEditingController _linkedInController = TextEditingController();
  final TextEditingController _youtubeController = TextEditingController();
  final TextEditingController _pinterestController = TextEditingController();

  int buildq = 0;
  @override
  Widget build(BuildContext context) {
    // print("Called Buuild");
    if (buildq == 0) {
      _nameController.text = _profileController.profileDetails.value.name ?? '';
      _compController.text =
          _profileController.profileDetails.value.cmpName ?? '';
      _designationController.text =
          _profileController.profileDetails.value.designation ?? '';
      _addressController.text =
          _profileController.profileDetails.value.address ?? '';
      _mapurlController.text =
          _profileController.profileDetails.value.map ?? '';
      _mobileController.text =
          _profileController.profileDetails.value.mobile ?? '';
      _altnumController.text =
          _profileController.profileDetails.value.alterNateNo ?? '';
      _whatsappController.text =
          _profileController.profileDetails.value.whatsapp ?? '';
      _emailController.text =
          _profileController.profileDetails.value.email ?? '';
      _websiteController.text =
          _profileController.profileDetails.value.webSite ?? '';

      _facebookController.text =
          _profileController.profileDetails.value.facebook ?? '';
      _instaController.text =
          _profileController.profileDetails.value.instagram ?? '';
      _twitterController.text =
          _profileController.profileDetails.value.twitter ?? '';
      _linkedInController.text =
          _profileController.profileDetails.value.linkedIn ?? '';
      _youtubeController.text =
          _profileController.profileDetails.value.youtube ?? '';
      _pinterestController.text =
          _profileController.profileDetails.value.printest ?? '';

      buildq++;
    }

    Responsive.init(context);
    return WillPopScope(
      onWillPop: () async {
        _profileController.profileImage.value = File('');
        _profileController.getProfileDetails();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
           elevation: 1,
          title: Text(
            'Edit Profile',
            style: TextStyle(

                // color: Colors.black,
                fontSize: Responsive.safeBlockVertical * 2.50),
          ),
          // actions: [
          //   // TextButton(
          //   //   onPressed: () {},
          //   //   child: Column(
          //   //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //   //     children: [
          //   //       Row(
          //   //         children: [
          //   //           Icon(
          //   //             FontAwesomeIcons.wallet,
          //   //             color: Color(0xffC58C63),
          //   //             size: Responsive.safeBlockHorizontal * 3.5,
          //   //           ),
          //   //           const SizedBox(
          //   //             width: 5,
          //   //           ),
          //   //           Obx(() {
          //   //             return Text(
          //   //               '${_profileController.walletpoints}',
          //   //               style: TextStyle(
          //   //                   fontSize: Responsive.safeBlockHorizontal * 3.5,
          //   //                   fontWeight: FontWeight.bold,
          //   //                   color:
          //   //                   (ThemeService().headerColor.computeLuminance() >
          //   //                       .5
          //   //                       ? Colors.black
          //   //                       : Colors.white)),
          //   //             );
          //   //           }),
          //   //           const SizedBox(
          //   //             width: 10,
          //   //           ),
          //   //         ],
          //   //       ),
          //   //       Row(
          //   //         children: [
          //   //           Icon(
          //   //             FontAwesomeIcons.bandcamp,
          //   //             color: Color(0xffFFD700),
          //   //             size: Responsive.safeBlockHorizontal * 3.5,
          //   //           ),
          //   //           const SizedBox(
          //   //             width: 5,
          //   //           ),
          //   //           Obx(() {
          //   //             return Text(
          //   //               '${_profileController.offerpoints}',
          //   //               style: TextStyle(
          //   //                   fontSize: Responsive.safeBlockHorizontal * 3.5,
          //   //                   fontWeight: FontWeight.bold,
          //   //                   color:
          //   //                   (ThemeService().headerColor.computeLuminance() >
          //   //                       .5
          //   //                       ? Colors.black
          //   //                       : Colors.white)),
          //   //             );
          //   //           }),
          //   //           const SizedBox(
          //   //             width: 10,
          //   //           ),
          //   //         ],
          //   //       ),
          //   //       // Row(
          //   //       //   children: [
          //   //       //     Icon(
          //   //       //       FontAwesomeIcons.wallet,
          //   //       //       color: Color(0xffC58C63),
          //   //       //       size: Responsive.safeBlockHorizontal * 4,
          //   //       //     ),
          //   //       //     const SizedBox(
          //   //       //       width: 5,
          //   //       //     ),
          //   //       //     Obx(() {
          //   //       //       return Text(
          //   //       //         '${_profileController.walletpoints}',
          //   //       //         style: TextStyle(
          //   //       //             fontSize: Responsive.safeBlockHorizontal * 4,
          //   //       //             fontWeight: FontWeight.bold,
          //   //       //             color:
          //   //       //                 (ThemeService().headerColor.computeLuminance() >
          //   //       //                         .5
          //   //       //                     ? Colors.black
          //   //       //                     : Colors.white)),
          //   //       //       );
          //   //       //     }),
          //   //       //     const SizedBox(
          //   //       //       width: 10,
          //   //       //     ),
          //   //       //   ],
          //   //       // ),
          //   //     ],
          //   //   ),
          //   // )
          // ],
        ),
        body: Obx(() {
          return IndexedStack(
            index: _profileController.mapFormIndex.value,
            children: [
              Form(
                  key: form_key,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: Responsive.safeBlockHorizontal * 2),
                    child: ListView(
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        children: [
                          SizedBox(
                            height: Responsive.safeBlockVertical * 3,
                          ),
                          const Center(
                              // child: Stack(
                              //   children: [
                              //     buildImage(),
                              //     Positioned(
                              //       bottom: 0,
                              //       right: 3,
                              //       child: buildEditIcon(Colors.grey.shade300),
                              //     ),
                              //   ],
                              // ),
                              ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 2,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                _profileController
                                        .profileImage.value.path.isEmpty
                                    ? 'Click On Image to change photo'
                                    : 'Click update button below to upload\nClick On Image to change photo',
                                textAlign: TextAlign.center,
                              )),

                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Name !';
                                    }
                                    return null;
                                  },
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Name'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter Company Name !';
                                    }
                                    return null;
                                  },
                                  controller: _compController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Company Name'),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          TextFormField(
                            controller: _designationController,
                            decoration: const InputDecoration(
                                isDense: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Enter Designation'),
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          TextField(
                            controller: _addressController,
                            minLines: 3,
                            maxLines: 5,
                            decoration: const InputDecoration(
                                isDense: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Enter Address'),
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          TextField(
                            // any number you need (It works as the rows for the textarea)

                            controller: _mapurlController,
                            readOnly: true,
                            decoration: InputDecoration(
                                suffixIcon: TextButton(
                                    onPressed: () {
                                      _profileController.changeIndex(1);
                                    },
                                    child: const Text("change")),
                                isDense: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: const OutlineInputBorder(),
                                labelText: 'Map URL'),
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  readOnly: true,
                                  controller: _mobileController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Mobile Number'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextField(
                                  // readOnly: true,
                                  keyboardType: TextInputType.number,
                                  controller: _altnumController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Alternate Mobile Number'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _whatsappController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Whatsapp Number'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _emailController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Email'),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          TextField(
                            controller: _websiteController,
                            decoration: const InputDecoration(
                                isDense: true,
                                fillColor: Colors.white,
                                filled: true,
                                border: OutlineInputBorder(),
                                labelText: 'Enter full Website'),
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 2,
                          ),

                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _facebookController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Facebook link'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _instaController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Instagram link'),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _twitterController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Twitter link'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _linkedInController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter LinkedIn link'),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _youtubeController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Youtube link'),
                                ),
                              ),
                              SizedBox(
                                width: Responsive.safeBlockHorizontal * 1.5,
                              ),
                              Expanded(
                                child: TextField(
                                  controller: _pinterestController,
                                  decoration: const InputDecoration(
                                      isDense: true,
                                      fillColor: Colors.white,
                                      filled: true,
                                      border: OutlineInputBorder(),
                                      labelText: 'Enter Pinterest link'),
                                ),
                              ),
                            ],
                          ),

                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 3,
                          ),

                          Obx(
                            () => AnimatedSwitcher(
                              duration: const Duration(milliseconds: 500),
                              transitionBuilder: (widget, anim) {
                                final tween = Tween<double>(begin: 0, end: 1);
                                final opacity = tween.animate(anim);

                                return FadeTransition(
                                  opacity: opacity,
                                  child: widget,
                                );
                              },
                              child: _profileController.isUpdating.value
                                  ? const Center(
                                      child: Column(
                                        children: [
                                          SizedBox(height: 20),
                                          CircularProgressIndicator(),
                                        ],
                                      ),
                                    )
                                  : SizedBox(
                                      width: double.infinity,
                                      child: MaterialButton(
                                        onPressed: () async {
                                          if (form_key.currentState!
                                              .validate()) {
                                            FocusManager.instance.primaryFocus!
                                                .unfocus();
                                            _profileController.updateProfile(
                                                altno: _altnumController.text,
                                                compname: _compController.text,
                                                designation:
                                                    _designationController.text,
                                                fburl: _facebookController.text,
                                                instaurl: _instaController.text,
                                                linkedinurl:
                                                    _linkedInController.text,
                                                mapurl: _mapurlController.text,
                                                pinteresturl:
                                                    _pinterestController.text,
                                                twitterurl:
                                                    _twitterController.text,
                                                website:
                                                    _websiteController.text,
                                                youtubeurl:
                                                    _youtubeController.text,
                                                address:
                                                    _addressController.text,
                                                name: _nameController.text,
                                                email: _emailController.text,
                                                whatsapp:
                                                    _whatsappController.text);
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
                                          // width: Responsive.safeBlockHorizontal * 50,
                                          decoration: BoxDecoration(
                                            color: Colors.indigo,
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            // gradient: String_class.gradient_orange_button
                                          ),
                                          padding: const EdgeInsets.all(0),
                                          child: const Text(
                                            "UPDATE PROFILE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),

                          SizedBox(
                            height: Responsive.safeBlockVertical * 1.5,
                          ),
                          SizedBox(
                            height: Responsive.safeBlockVertical * 3,
                          ),

                          // Visibility(
                          //     visible: visible,
                          //     child: Container(
                          //         margin: EdgeInsets.only(bottom: 30),
                          //         child: CircularProgressIndicator())),
                          // Container(
                          //   width: 200,
                          //   decoration: BoxDecoration(
                          //     borderRadius: BorderRadius.all(
                          //       Radius.circular(50.0),
                          //     ),
                          //   ),
                          //   child: ElevatedButton(
                          //     child: Text(
                          //       'Submit',
                          //       style: TextStyle(fontSize: 17, color: Colors.white),
                          //     ),
                          //     onPressed: () {
                          //       final isValid = _formKey.currentState.validate();
                          //       if (isValid) {
                          //         userLogin();
                          //       }
                          //     },
                          //   ),
                          // ),
                          // SizedBox(height: 10),
                          // GestureDetector(
                          //   onTap: () {
                          //     Navigator.of(context).pop();
                          //   },
                          //   child: Text(
                          //     'Cancel',
                          //     style: TextStyle(color: Colors.pink),
                          //   ),
                          // ),
                          // SizedBox(height: 50),
                        ]

                        // [
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 2,
                        //   ),
                        //   TextFormField(
                        //     validator: (str) {
                        //       if (str == null || str.isEmpty) return 'Required';
                        //       return null;
                        //     },
                        //     controller: _nameController,
                        //     decoration: const InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: 'Name',
                        //         prefixIcon: Icon(Icons.person)),
                        //   ),
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 2,
                        //   ),
                        //   TextFormField(
                        //     controller: _mobileController,
                        //     validator: (str) {
                        //       if (str == null || str.isEmpty) return 'Required';
                        //       return null;
                        //     },
                        //     readOnly: true,
                        //     decoration: const InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: 'Mobile',
                        //         prefixIcon: Icon(Icons.phone)),
                        //   ),
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 2,
                        //   ),
                        //   TextFormField(
                        //     controller: _emailController,
                        //     keyboardType: TextInputType.emailAddress,
                        //     decoration: const InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: 'Email',
                        //         prefixIcon: Icon(Icons.alternate_email_sharp)),
                        //   ),
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 2,
                        //   ),
                        //   TextFormField(
                        //     controller: _whatsappController,
                        //     keyboardType: TextInputType.phone,
                        //     decoration: const InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: 'WhatsApp',
                        //         prefixIcon: Icon(FontAwesomeIcons.whatsapp)),
                        //   ),
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 2,
                        //   ),
                        //   TextFormField(
                        //     controller: _addressController,
                        //     validator: (str) {
                        //       if (str == null || str.isEmpty) return 'Required';
                        //       return null;
                        //     },
                        //     decoration: const InputDecoration(
                        //         border: OutlineInputBorder(),
                        //         labelText: 'Address',
                        //         prefixIcon: Icon(Icons.location_on_outlined)),
                        //     minLines: 3,
                        //     maxLines: null,
                        //   ),
                        //   SizedBox(
                        //     height: Responsive.safeBlockVertical * 6,
                        //   ),
                        //   ...
                        // ],
                        ),
                  )),
              Center(
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20),
                      const Text(
                        "Tap to mark location",
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * .60,
                        child: GoogleMap(
                            zoomGesturesEnabled: true,
                            myLocationEnabled: true,
                            mapToolbarEnabled: true,
                            trafficEnabled: true,
                            myLocationButtonEnabled: true,
                            compassEnabled: true,
                            buildingsEnabled: true,
                            initialCameraPosition: const CameraPosition(
                                target: LatLng(20.5937, 78.9629), zoom: 1),
                            markers: _profileController.markers,
                            onTap: _profileController.onTap,
                            onMapCreated: _profileController.onMapCreated),
                      ),
                      const Row(
                        children: [
                          Expanded(child: SizedBox()),
                        ],
                      ),
                      const SizedBox(width: 10),
                      MaterialButton(
                          color: Colors.green,
                          onPressed: () {
                            if (_profileController.markers.isNotEmpty) {
                              _mapurlController.text =
                                  'https://www.google.com/maps/search/?api=1&query=${_profileController.markers.toList()[0].position.latitude},${_profileController.markers.toList()[0].position.longitude}';
                              _profileController.changeIndex(0);
                            } else {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Error!!"),
                                      content:
                                          const Text("Please mark location"),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: const Text(
                                              "Ok",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ))
                                      ],
                                    );
                                  });
                            }
                          },
                          child: const Text("Ok",
                              style: TextStyle(color: Colors.white))),
                      MaterialButton(
                          onPressed: () {
                            _profileController.changeIndex(0);
                          },
                          color: Colors.red,
                          child: const Text(
                            "Cancel",
                            style: TextStyle(color: Colors.white),
                          )),
                    ],
                  ),
                ),
              )
            ],
          );
        }),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.grey.shade300,
        all: 3,
        child: const Icon(
          Icons.add_a_photo_outlined,
          color: Colors.black54,
          // size: MediaQuery.of(context).padding.top / 2,
        ),
      );

  Widget buildCircle({
    required Widget child,
    double? all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all ?? 0),
          color: color,
          child: child,
        ),
      );

  // Widget buildImage() {
  //   return Obx(() {
  //     dynamic image;
  //
  //     if (_profileController.profileImageCode.value != 200) {
  //       if (_profileController.profileImage.value.path.isEmpty) {
  //         // log("No profile photo");
  //         image = const AssetImage(
  //           'assets/images/profilee.jpg',
  //         );
  //       } else {
  //         image = FileImage(_profileController.profileImage.value);
  //       }
  //     } else {
  //       image = NetworkImage(
  //         '$mainurl/Customer/CutomerImage/${_profileController.profileId}.png',
  //       );
  //     }
  //
  //     return ClipOval(
  //       child: Material(
  //         color: Colors.grey,
  //         child: Ink.image(
  //           image: image,
  //           fit: BoxFit.cover,
  //           width: Responsive.safeBlockHorizontal * 25,
  //           height: Responsive.safeBlockHorizontal * 25,
  //           child: InkWell(onTap: () {
  //             _profileController.showPicker();
  //           }),
  //         ),
  //       ),
  //       // ),
  //
  //       //CircleAvatar(
  //
  //       //backgroundImage:NetworkImage("https://www.google.com/search?q=empty+profile+image&tbm=isch&source=iu&ictx=1&fir=H6pHpB03ZEAgeM%252Cwg0CyFWNfK7o5M%252C_%253BN4P3xo67_mWxmM%252CHeY8zRMtJ34UeM%252C_%253BGHbdym26eAzRCM%252CFdNZT9hRZ6zyYM%252C_%253BVAnBYwEE4o134M%252Ci6PluJXyduOMCM%252C_%253BbHZdHgtW4ivZFM%252CCxUTBSApiz-yBM%252C_%253B3i3F7OdapeJYeM%252CrRWD3SDgbLRjnM%252C_%253BmCvSeILvbfGkTM%252C3WZxj6Pr3HvSeM%252C_%253BDgyhkurhLepplM%252CMG0JGB0B8kPXNM%252C_%253BebRpTbzi5qxLtM%252C3WZxj6Pr3HvSeM%252C_%253Bo6XfeaaTcDGrfM%252C7pNi_vLjRH878M%252C_%253B5P7WUpPVo9kDoM%252C0PCLSDsuQ6ciMM%252C_%253BZE8DZU6eMo4aOM%252CmPqhGndqOzd0vM%252C_%253BUMhRKNG9mONJvM%252Crr5Wq-7hnPiLDM%252C_%253BwhJPP2I9w8gt2M%252C522HfNz6rpgTcM%252C_%253BkLXnZALTc8QHxM%252CrRWD3SDgbLRjnM%252C_%253B-zHxKmlxQXMjGM%252Crr5Wq-7hnPiLDM%252C_&vet=1&usg=AI4_-kQ2vciEnuMvOvrLVogPGTe6xnEPKg&sa=X&ved=2ahUKEwj24cmJ0-D0AhW0slYBHd8SDBIQ9QF6BAgJEAE#imgrc=o6XfeaaTcDGrfM"),
  //
  //       //    backgroundColor: Colors.grey,
  //       //    radius: 40,
  //       //    child:  InkWell(
  //       //
  //       //      child: CircleAvatar(
  //       //        radius: 47.0,
  //       //        backgroundColor: Color(0xff362F87).withOpacity(0.5),
  //       //        //backgroundColor: Colors.transparent,
  //       //        child: CircleAvatar(
  //       //          radius: 46.0,
  //       //          backgroundColor: Color(0xff362F87).withOpacity(0.5),
  //       //          // backgroundColor: Colors.transparent,
  //       //          child: CachedNetworkImage(
  //       //            key: UniqueKey(),
  //       //
  //       //             imageUrl: "",
  //       //            height: 90,
  //       //            width: 90,
  //       //
  //       //            //   imageUrl:
  //       //            imageBuilder: (context, imageProvider) => Container(
  //       //              decoration: BoxDecoration(
  //       //
  //       //                shape: BoxShape.circle,
  //       //                image: DecorationImage(
  //       //                  image: imageProvider,
  //       //                  fit: BoxFit.cover,
  //       //                  // colorFilter:
  //       //                  //ColorFilter.mode(Colors.red, BlendMode.colorBurn)
  //       //                ),
  //       //              ),
  //       //            ),
  //       //            placeholder: (context, url) =>
  //       //                CircularProgressIndicator(),
  //       //            errorWidget: (context, url, error) => Icon(
  //       //              Icons.person,
  //       //              color: Colors.white,
  //       //              size: 60,
  //       //            ),
  //       //          ),
  //       //        ),
  //       //      ),
  //       //
  //       //
  //       // onTap:(){
  //       //   _showPicker(context);
  //       //   DefaultCacheManager().emptyCache();
  //       //   imageCache!.clear();
  //       //   imageCache!.clearLiveImages();
  //       //
  //       //
  //       //
  //       // }
  //       //    ),
  //     );
  //   });
  // }
}
