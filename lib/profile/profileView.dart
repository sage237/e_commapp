
import '../favorites/favoritesView.dart';
import '../orderhistory/orderhistoryView.dart';

import '../profile/profileController.dart';
import '../profile/vieweditprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../responsiveclass.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController _profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    Responsive.init(context);
    return Scaffold(
      appBar: AppBar(

        elevation: 1,
        title: Obx(() {
          return Text(
            '${_profileController.profileDetails.value.name}',
            style: TextStyle(

                // color: Colors.black,
                fontSize: Responsive.safeBlockVertical * 2.50),
          );
        }),
        actions: [
          IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Are you sure'),
                    content: const Text('Do you want to logouT?'),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('No')),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            _profileController.logout();
                          },
                          child: const Text('Yes')),
                    ],
                  ),
                );
              },
              icon: const Icon(Icons.power_settings_new))
        ],
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //
        //     // GestureDetector(
        //     //   onTap: () {
        //     //
        //     //   },
        //     //   child: Text(
        //     //     'Edit Profile',
        //     //     style: TextStyle(
        //     //         color: Theme.of(context).primaryColor,
        //     //         // color: Colors.black,
        //     //         fontSize: Responsive.safeBlockVertical * 2),
        //     //   ),
        //     // )
        //   ],
        // ),
        // actions: [
        //   TextButton(
        //     onPressed: () {},
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //       children: [
        //         Row(
        //           children: [
        //             Icon(
        //               FontAwesomeIcons.wallet,
        //               color: const Color(0xffC58C63),
        //               size: Responsive.safeBlockHorizontal * 3.5,
        //             ),
        //             const SizedBox(
        //               width: 5,
        //             ),
        //             const SizedBox(
        //               width: 10,
        //             ),
        //           ],
        //         ),
        //         Row(
        //           children: [
        //             Icon(
        //               FontAwesomeIcons.bandcamp,
        //               color: const Color(0xffFFD700),
        //               size: Responsive.safeBlockHorizontal * 3.5,
        //             ),
        //             const SizedBox(
        //               width: 5,
        //             ),
        //
        //             const SizedBox(
        //               width: 10,
        //             ),
        //           ],
        //         ),
        //         // Row(
        //         //   children: [
        //         //     Icon(
        //         //       FontAwesomeIcons.wallet,
        //         //       color: Color(0xffC58C63),
        //         //       size: Responsive.safeBlockHorizontal * 4,
        //         //     ),
        //         //     const SizedBox(
        //         //       width: 5,
        //         //     ),
        //         //     Obx(() {
        //         //       return Text(
        //         //         '${_profileController.walletpoints}',
        //         //         style: TextStyle(
        //         //             fontSize: Responsive.safeBlockHorizontal * 4,
        //         //             fontWeight: FontWeight.bold,
        //         //             color:
        //         //                 (ThemeService().headerColor.computeLuminance() >
        //         //                         .5
        //         //                     ? Colors.black
        //         //                     : Colors.white)),
        //         //       );
        //         //     }),
        //         //     const SizedBox(
        //         //       width: 10,
        //         //     ),
        //         //   ],
        //         // ),
        //       ],
        //     ),
        //   )
        // ],
      ),
      body:
          // Obx(() {
          // Profile profile = _profileController.profileDetails.value;
          // return
          SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: Responsive.safeBlockVertical * 9,
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: const Icon(Icons.person),
                  title: const Text('Your Profile'),
                  subtitle: const Text('View / Edit Your Profile '),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => ViewEditProfile());
                  },
                ),
              ),
            ),
            SizedBox(
              height: Responsive.safeBlockVertical * 9,
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: const Icon(Icons.lock),
                  title: const Text('Password'),
                  subtitle: const Text('Change Your Password'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {

                  },
                ),
              ),
            ),

            SizedBox(
              height: Responsive.safeBlockVertical * 9,
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: const Icon(Icons.shopping_bag_outlined),
                  title: const Text('Your Orders'),
                  subtitle: const Text('View all your purchases'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => OrderListPage());
                  },
                ),
              ),
            ),

            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.phone),
            //     title: const Text('Mobile number'),
            //     subtitle:
            //         Text(_profileController.profileDetails.value.mobile),
            //     // trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.alternate_email),
            //     title: const Text('E-Mail'),
            //     subtitle:
            //         Text(_profileController.profileDetails.value.email),
            //     // trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.location_city),
            //     title: const Text('Address'),
            //     subtitle:
            //         Text(_profileController.profileDetails.value.address),
            //     // trailing: Icon(Icons.arrow_forward_ios),
            //   ),
            // ),

            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.location_city),
            //     title: const Text('Change Header'),
            //     subtitle: const Text('Change header color'),
            //     // trailing: Icon(Icons.arrow_forward_ios),
            //     onTap: () {
            //       showDialog(
            //           context: context,
            //           builder: (context) {
            //             return AlertDialog(
            //               content: ColorPicker(
            //                 pickerColor: ThemeService().headerColor,
            //                 onColorChanged: (onColorChanged) {},
            //                 colorPickerWidth: 300,
            //                 pickerAreaHeightPercent: 0.7,
            //                 enableAlpha: true,
            //                 pickerAreaBorderRadius: const BorderRadius.only(
            //                   topLeft: Radius.circular(2),
            //                   topRight: Radius.circular(2),
            //                 ),
            //               ),
            //               actions: [
            //                 TextButton(
            //                     onPressed: () {
            //                       Navigator.of(context).pop();
            //                     },
            //                     child: Text('ok'))
            //               ],
            //             );
            //           });
            //     },
            //   ),
            // ),

            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.shopping_bag_outlined),
            //     title: const Text('Change header '),
            //     subtitle: const Text('Change header theme'),
            //     trailing: const Icon(Icons.arrow_forward_ios),
            //     onTap: () {
            //       Color oldColor = ThemeService().headerColor;
            //       if (oldColor.computeLuminance() < .50) {
            //         // Color(4294967295);
            //         ThemeService().setHeadColor = Colors.white;
            //         // log('changedHeader ${ThemeService().headerColor.value}');
            //       } else {
            //         ThemeService().setHeadColor = Colors.black;
            //         // log('changedHeader black ${ThemeService().headerColor.value}');
            //       }
            //       ThemeService().switchTheme();
            //       Get.dialog(WillPopScope(
            //         child: AlertDialog(
            //           title: const Text('Header theme changed'),
            //           content: const Text('Restart app to see changes'),
            //           actions: [
            //             TextButton(
            //                 onPressed: () {
            //                   SystemNavigator.pop();
            //                 },
            //                 child: const Text('Ok'))
            //           ],
            //         ),
            //         onWillPop: () async => false,
            //       ));
            //     },
            //   ),
            // ),
            // Card(
            //   child: ListTile(
            //     leading: const Icon(Icons.shopping_bag_outlined),
            //     title: const Text('Change footer '),
            //     subtitle: const Text('Change footer theme'),
            //     trailing: const Icon(Icons.arrow_forward_ios),
            //     onTap: () {
            //       Color oldColor = ThemeService().footerColor;
            //       if (oldColor.computeLuminance() < .50) {
            //         ThemeService().setFootColor = Colors.white;
            //       } else {
            //         ThemeService().setFootColor = Colors.black;
            //       }
            //       ThemeService().switchTheme();
            //
            //       Get.dialog(WillPopScope(
            //         child: AlertDialog(
            //           title: const Text('Footer theme changed'),
            //           content: const Text('Restart app to see changes'),
            //           actions: [
            //             TextButton(
            //                 onPressed: () {
            //                   SystemNavigator.pop();
            //                 },
            //                 child: const Text('Ok'))
            //           ],
            //         ),
            //         onWillPop: () async => false,
            //       ));
            //     },
            //   ),
            // ),

            SizedBox(
              height: Responsive.safeBlockVertical * 9,
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: const Icon(Icons.star),
                  title: const Text('Favorites'),
                  subtitle: const Text('Your favorite items'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Get.to(() => FavoritePage());
                  },
                ),
              ),
            ),



            // SizedBox(
            //   height: Responsive.safeBlockVertical * 9,
            //   child: Card(
            //     child: ListTile(
            //       isThreeLine: true,
            //       dense: true,
            //       leading: const Icon(Icons.handshake_outlined),
            //       title: const Text('My card'),
            //       subtitle: const Text('View your digital card'),
            //       trailing: const Icon(Icons.arrow_forward_ios),
            //       onTap: () {
            //         Get.to(() => ChangePasswordPage());
            //       },
            //     ),
            //   ),
            // ),

            // Card(
            //   child: ListTile(
            //     dense: true,
            //     leading: const Icon(Icons.feedback_outlined),
            //     title: const Text('feedback'),
            //     subtitle: const Text('Tell us your valuable thought about us'),
            //     trailing: const Icon(Icons.arrow_forward_ios),
            //     onTap: () {
            //       Get.to(
            //         () => WebViewExample(
            //           controller: WebViewController()
            //             ..loadRequest(Uri.parse(
            //                 '$mainurl/vcard/?I=${_profileController.profileId}&C=${_profileController.profileDetails.value.cmpName}'))
            //             ..setJavaScriptMode(JavaScriptMode.unrestricted)
            //             ..setNavigationDelegate(
            //                 NavigationDelegate(onNavigationRequest: (request) {
            //               // log("Url ${request.url}");
            //
            //               if (request.url.startsWith('tel:')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url.startsWith('sms:')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url.startsWith('whatsapp:') ||
            //                   request.url.startsWith('https://wa.me/') ||
            //                   request.url
            //                       .startsWith('https://api.whatsapp.com/')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url.startsWith('mailto:')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url
            //                   .startsWith('$mainurl/vcard/echo.php')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url
            //                   .startsWith('https://www.youtube.com/')) {
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               if (request.url.startsWith('$mainurl/AdminVst/')) {
            //                 launchUrl(Uri.parse(request.url),
            //                     mode: LaunchMode.externalApplication);
            //                 return NavigationDecision.prevent;
            //               }
            //
            //               return NavigationDecision.navigate;
            //             })),
            //           appBar: AppBar(
            //             backgroundColor: ThemeService().headerColor,
            //             elevation: 1,
            //             title: Text(
            //               'My card',
            //               style: TextStyle(
            //                   color: (ThemeService()
            //                               .headerColor
            //                               .computeLuminance() >
            //                           .5
            //                       ? Colors.black
            //                       : Colors.white),
            //                   // color: Colors.black,
            //                   fontSize: Responsive.safeBlockVertical * 2.50),
            //             ),
            //             actions: [
            //               TextButton(
            //                   onPressed: () {
            //                     openwhatsapp1(context);
            //                   },
            //                   child: Icon(
            //                     Icons.share,
            //                     color: (ThemeService()
            //                                 .headerColor
            //                                 .computeLuminance() >
            //                             .5
            //                         ? Colors.black
            //                         : Colors.white),
            //                   ))
            //               // TextButton(
            //               //   onPressed: () {},
            //               //   child: Column(
            //               //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //               //     children: [
            //               //       Row(
            //               //         children: [
            //               //           Icon(
            //               //             FontAwesomeIcons.wallet,
            //               //             color: Color(0xffC58C63),
            //               //             size: Responsive.safeBlockHorizontal * 3.5,
            //               //           ),
            //               //           const SizedBox(
            //               //             width: 5,
            //               //           ),
            //               //           Obx(() {
            //               //             return Text(
            //               //               '${_profileController.walletpoints}',
            //               //               style: TextStyle(
            //               //                   fontSize: Responsive.safeBlockHorizontal * 3.5,
            //               //                   fontWeight: FontWeight.bold,
            //               //                   color:
            //               //                   (ThemeService().headerColor.computeLuminance() >
            //               //                       .5
            //               //                       ? Colors.black
            //               //                       : Colors.white)),
            //               //             );
            //               //           }),
            //               //           const SizedBox(
            //               //             width: 10,
            //               //           ),
            //               //         ],
            //               //       ),
            //               //       Row(
            //               //         children: [
            //               //           Icon(
            //               //             FontAwesomeIcons.bandcamp,
            //               //             color: Color(0xffFFD700),
            //               //             size: Responsive.safeBlockHorizontal * 3.5,
            //               //           ),
            //               //           const SizedBox(
            //               //             width: 5,
            //               //           ),
            //               //           Obx(() {
            //               //             return Text(
            //               //               '${_profileController.offerpoints}',
            //               //               style: TextStyle(
            //               //                   fontSize: Responsive.safeBlockHorizontal * 3.5,
            //               //                   fontWeight: FontWeight.bold,
            //               //                   color:
            //               //                   (ThemeService().headerColor.computeLuminance() >
            //               //                       .5
            //               //                       ? Colors.black
            //               //                       : Colors.white)),
            //               //             );
            //               //           }),
            //               //           const SizedBox(
            //               //             width: 10,
            //               //           ),
            //               //         ],
            //               //       ),
            //               //       // Row(
            //               //       //   children: [
            //               //       //     Icon(
            //               //       //       FontAwesomeIcons.wallet,
            //               //       //       color: Color(0xffC58C63),
            //               //       //       size: Responsive.safeBlockHorizontal * 4,
            //               //       //     ),
            //               //       //     const SizedBox(
            //               //       //       width: 5,
            //               //       //     ),
            //               //       //     Obx(() {
            //               //       //       return Text(
            //               //       //         '${_profileController.walletpoints}',
            //               //       //         style: TextStyle(
            //               //       //             fontSize: Responsive.safeBlockHorizontal * 4,
            //               //       //             fontWeight: FontWeight.bold,
            //               //       //             color:
            //               //       //                 (ThemeService().headerColor.computeLuminance() >
            //               //       //                         .5
            //               //       //                     ? Colors.black
            //               //       //                     : Colors.white)),
            //               //       //       );
            //               //       //     }),
            //               //       //     const SizedBox(
            //               //       //       width: 10,
            //               //       //     ),
            //               //       //   ],
            //               //       // ),
            //               //     ],
            //               //   ),
            //               // )
            //             ],
            //           ),
            //         ),
            //       );
            //     },
            //   ),
            // ),

            SizedBox(
              height: Responsive.safeBlockVertical * 9,
              child: Card(
                child: ListTile(
                  isThreeLine: true,
                  dense: true,
                  leading: const Icon(
                    Icons.wallet,
                    color: Color(0xFF624a2e),
                  ),
                  title: const Text('Wallet Points'),
                  subtitle: const Text('Your Wallet balance'),
                  trailing: Obx(() {
                    return Text(
                      '${_profileController.walletpoints}',
                      style: TextStyle(
                        fontSize: Responsive.safeBlockHorizontal * 3.5,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }),
                ),
              ),
            ),


            // Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: Responsive.safeBlockHorizontal * 30),
            //   child: SizedBox(
            //     child: OutlinedButton(
            //       onPressed: () {
            //
            //       },
            //       style: OutlinedButton.styleFrom(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(
            //                 Responsive.safeBlockHorizontal * 10)),
            //         backgroundColor: Colors.red,
            //       ),
            //       child: Text(
            //         'LOG OUT',
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontSize: Responsive.safeBlockVertical * 2),
            //       ),
            //     ),
            //   ),
            // ),

            // SizedBox(height: Responsive.safeBlockVertical * 3),

            // Container(
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     shape: BoxShape.circle,
            //     boxShadow: [
            //       BoxShadow(
            //           blurRadius: 5, color: Colors.grey, spreadRadius: 3)
            //     ],
            //   ),
            //   child: CircleAvatar(
            //     child: ClipOval(
            //       child: Image.network(
            //         profile.image ?? '',
            //         errorBuilder: (context, obj, strace) {
            //           return Image.asset(
            //             'assets/images/as.png',
            //           );
            //         },
            //       ),
            //     ),
            //     backgroundColor: Colors.white,
            //     radius: Responsive.safeBlockVerticalWAB * 7,
            //   ),
            // ),
            // SizedBox(height: Responsive.safeBlockVerticalWAB * 3),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //   children: [
            //     SizedBox(),
            //     GestureDetector(
            //       onTap: () {
            //         Get.to(() => OrderListPage());
            //       },
            //       child: Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               shape: BoxShape.circle,
            //               boxShadow: [
            //                 BoxShadow(
            //                     blurRadius: 5,
            //                     color: Colors.grey.shade300,
            //                     spreadRadius: 1)
            //               ],
            //             ),
            //             child: CircleAvatar(
            //               radius: Responsive.safeBlockVerticalWAB * 3,
            //               backgroundColor: Colors.white,
            //               child: const Icon(Icons.history),
            //             ),
            //           ),
            //           SizedBox(
            //             height: Responsive.safeBlockVertical,
            //           ),
            //           Text(
            //             'Order history',
            //             style: TextStyle(
            //                 fontSize: Responsive.safeBlockVertical * 1.3),
            //           )
            //         ],
            //       ),
            //     ),
            //     Column(
            //       children: [
            //         Container(
            //           decoration: BoxDecoration(
            //             color: Colors.white,
            //             shape: BoxShape.circle,
            //             boxShadow: [
            //               BoxShadow(
            //                   blurRadius: 5,
            //                   color: Colors.grey.shade300,
            //                   spreadRadius: 1)
            //             ],
            //           ),
            //           child: CircleAvatar(
            //             radius: Responsive.safeBlockVerticalWAB * 3,
            //             backgroundColor: Colors.white,
            //             child: const Icon(Icons.edit),
            //           ),
            //         ),
            //         SizedBox(
            //           height: Responsive.safeBlockVertical,
            //         ),
            //         Text(
            //           'Edit profile',
            //           style: TextStyle(
            //               fontSize: Responsive.safeBlockVertical * 1.3),
            //         )
            //       ],
            //     ),
            //     GestureDetector(
            //       onTap: () {
            //         showDialog(
            //           context: context,
            //           builder: (context) => AlertDialog(
            //             title: Text('Are you sure'),
            //             content: Text('Do you want to logou?'),
            //             actions: [
            //               TextButton(
            //                   onPressed: () {
            //                     Navigator.of(context).pop();
            //                   },
            //                   child: Text('No')),
            //               TextButton(
            //                   onPressed: () {
            //                     Navigator.of(context).pop();
            //                     _profileController.logout();
            //                   },
            //                   child: Text('Yes')),
            //             ],
            //           ),
            //         );
            //       },
            //       child: Column(
            //         children: [
            //           Container(
            //             decoration: BoxDecoration(
            //               color: Colors.white,
            //               shape: BoxShape.circle,
            //               boxShadow: [
            //                 BoxShadow(
            //                     blurRadius: 5,
            //                     color: Colors.grey.shade300,
            //                     spreadRadius: 1)
            //               ],
            //             ),
            //             child: CircleAvatar(
            //               radius: Responsive.safeBlockVerticalWAB * 3,
            //               backgroundColor: Colors.white,
            //               child: const Icon(Icons.power_settings_new),
            //             ),
            //           ),
            //           SizedBox(
            //             height: Responsive.safeBlockVertical,
            //           ),
            //           Text(
            //             'Log out',
            //             style: TextStyle(
            //                 fontSize: Responsive.safeBlockVertical * 1.3),
            //           )
            //         ],
            //       ),
            //     ),
            //     SizedBox(),
            //   ],
            // ),
            // SizedBox(height: Responsive.safeBlockVerticalWAB * 6),
            // Expanded(
            //     child: Padding(
            //   padding: EdgeInsets.symmetric(
            //       horizontal: Responsive.safeBlockHorizontal * 5),
            //   child: ListView(
            //     physics: const BouncingScrollPhysics(
            //         parent: AlwaysScrollableScrollPhysics()),
            //     children: [
            //       Container(
            //         height: Responsive.safeBlockVerticalWAB * 8,
            //         // color: Colors.red,
            //         child: Row(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 5,
            //                       color: Colors.grey.shade300,
            //                       spreadRadius: 1)
            //                 ],
            //               ),
            //               child: CircleAvatar(
            //                 radius: Responsive.safeBlockVerticalWAB * 5,
            //                 backgroundColor: Colors.white,
            //                 child: const Icon(Icons.person),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Responsive.safeBlockHorizontal * 5,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Spacer(),
            //                 Text(
            //                   'Name',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade400,
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 2),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   "${profile.name}",
            //                   style: TextStyle(
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 3),
            //                 ),
            //                 const Spacer(),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: Responsive.safeBlockVerticalWAB * 3,
            //       ),
            //       Container(
            //         height: Responsive.safeBlockVerticalWAB * 8,
            //         // color: Colors.red,
            //         child: Row(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 5,
            //                       color: Colors.grey.shade300,
            //                       spreadRadius: 1)
            //                 ],
            //               ),
            //               child: CircleAvatar(
            //                 radius: Responsive.safeBlockVerticalWAB * 5,
            //                 backgroundColor: Colors.white,
            //                 child: const Icon(Icons.phone),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Responsive.safeBlockHorizontal * 5,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Spacer(),
            //                 Text(
            //                   'Phone',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade400,
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 2),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   "${profile.mobile}",
            //                   style: TextStyle(
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 3),
            //                 ),
            //                 const Spacer(),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: Responsive.safeBlockVerticalWAB * 3,
            //       ),
            //       Container(
            //         height: Responsive.safeBlockVerticalWAB * 8,
            //         // color: Colors.red,
            //         child: Row(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 5,
            //                       color: Colors.grey.shade300,
            //                       spreadRadius: 1)
            //                 ],
            //               ),
            //               child: CircleAvatar(
            //                 radius: Responsive.safeBlockVerticalWAB * 5,
            //                 backgroundColor: Colors.white,
            //                 child: const Icon(Icons.alternate_email_outlined),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Responsive.safeBlockHorizontal * 5,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Spacer(),
            //                 Text(
            //                   'email',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade400,
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 2),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   "${profile.email}",
            //                   style: TextStyle(
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 3),
            //                 ),
            //                 const Spacer(),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //       SizedBox(
            //         height: Responsive.safeBlockVerticalWAB * 3,
            //       ),
            //       Container(
            //         height: Responsive.safeBlockVerticalWAB * 8,
            //         // color: Colors.red,
            //         child: Row(
            //           children: [
            //             Container(
            //               decoration: BoxDecoration(
            //                 color: Colors.white,
            //                 shape: BoxShape.circle,
            //                 boxShadow: [
            //                   BoxShadow(
            //                       blurRadius: 5,
            //                       color: Colors.grey.shade300,
            //                       spreadRadius: 1)
            //                 ],
            //               ),
            //               child: CircleAvatar(
            //                 radius: Responsive.safeBlockVerticalWAB * 5,
            //                 backgroundColor: Colors.white,
            //                 child: const Icon(Icons.location_city_outlined),
            //               ),
            //             ),
            //             SizedBox(
            //               width: Responsive.safeBlockHorizontal * 5,
            //             ),
            //             Column(
            //               crossAxisAlignment: CrossAxisAlignment.start,
            //               children: [
            //                 const Spacer(),
            //                 Text(
            //                   'Address',
            //                   style: TextStyle(
            //                       color: Colors.grey.shade400,
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 2),
            //                 ),
            //                 const Spacer(),
            //                 Text(
            //                   "${profile.address}",
            //                   style: TextStyle(
            //                       fontSize:
            //                           Responsive.safeBlockVerticalWAB * 3),
            //                 ),
            //                 const Spacer(),
            //               ],
            //             )
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // ))
          ],
        ),
        // );
        // }
      ),
    );
  }



  }
