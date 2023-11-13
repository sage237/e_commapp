import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/profilemodel.dart';
import '../variables.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:image_picker/image_picker.dart';

import '../loginpage/loginpageview.dart';

class ProfileController extends GetxController {
  Rx<Profile> profileDetails = Profile().obs;
  RxString walletpoints = '???'.obs;
  RxString offerpoints = '???'.obs;
  RxBool editmode = false.obs;
  Rx<File> profileImage = File('').obs;
  RxBool isUpdating = false.obs;
  RxInt profileImageCode = 0.obs;
  String profileId = '';

  ///For Google maps API

  RxInt mapFormIndex = 0.obs;
  RxSet<Marker> markers = <Marker>{}.obs;

  void onTap(LatLng position) {
    markers.add(Marker(
        markerId: const MarkerId('1'),
        position: position,
        infoWindow: InfoWindow(snippet: position.toString()),
        draggable: true,
        onDragEnd: (pos) {
          markers.add(Marker(
            markerId: const MarkerId('1'),
            position: pos,
            infoWindow: InfoWindow(snippet: position.toString()),
          ));
        }));
    markers.refresh();
  }

  changeIndex(int index) => mapFormIndex.value = index;
  late GoogleMapController googleMapController;
  void onMapCreated(GoogleMapController controller) {
    googleMapController = controller;
  }

  //Ended

  changeEditMode(bool mode) {
    editmode.value = mode;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getProfileDetails();


    super.onInit();
  }



  void getProfileDetails() async {



    try {
     CollectionReference cats= FirebaseFirestore.instance.collection('users');
var sp=await SharedPreferences.getInstance();
      final data =await cats.get();

      if (data.docs.isNotEmpty) {
        var prof=data.docs.firstWhere((element) => element['userid']==sp.getString('memberid'));
       log('prof ${prof.data()}');

       profileDetails.value = Profile(address: prof['address'],name: prof['name'],email: prof['email'],map: prof['map'],mobile: '${prof['mobile']}');
      }
    } catch (e) {
      log('$e');
    }
    try {

    } catch (e) {
      log('Exception calling customerImage $e');
    }
  }

  logout() async {
    // var sp = await SharedPreferences.getInstance();
    // sp.clear();

    Get.to(() => LoginPage(replaceTo: loginReplaceTO.profile));
  }

  void updateProfile(
      {required String name,
      required String email,
      required String whatsapp,
      required String compname,
      required String designation,
      required String altno,
      required String website,
      required String mapurl,
      required String fburl,
      required String instaurl,
      required String twitterurl,
      required String linkedinurl,
      required String youtubeurl,
      required String pinteresturl,
      required String address}) async {

    isUpdating(true);
    try {

    //   TODO Add update profile here

    } catch (e) {
      Get.snackbar('Failed', 'Something went wrong, please try again',
          snackPosition: SnackPosition.BOTTOM);
    } finally {
      isUpdating(false);
    }
  }

  // showPicker() {
  //   Get.bottomSheet(Container(
  //     color: Colors.white,
  //     child: Wrap(
  //       children: <Widget>[
  //         ListTile(
  //             leading: const Icon(Icons.photo_library),
  //             title: const Text('Gallery'),
  //             onTap: () {
  //               pickProfileImage(ImageSource.gallery);
  //               Get.back();
  //             }),
  //         ListTile(
  //           leading: const Icon(Icons.photo_camera),
  //           title: const Text('Camera'),
  //           onTap: () {
  //             pickProfileImage(ImageSource.camera);
  //             Get.back();
  //           },
  //         ),
  //       ],
  //     ),
  //   ));
  // }
  //
  // pickProfileImage(ImageSource source) async {
  //   XFile? result = await ImagePicker().pickImage(
  //       source: source,
  //       imageQuality: 100,
  //       preferredCameraDevice: CameraDevice.rear);
  //   if (result != null) {
  //     profileImageCode.value = 0;
  //     profileImage.value = File(result.path);
  //   }
  //
  //   //print("Profile pic selected: ${profileImage.path.split('/').last}");
  // }
}
