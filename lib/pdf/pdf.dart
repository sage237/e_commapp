// import 'dart:typed_data';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:intl/intl.dart';
// import 'package:pdf/pdf.dart';
// import 'package:printing/printing.dart';
//
// import '../appthemetest.dart';
// import '../responsiveclass.dart';
//
// class PDFViver extends StatefulWidget {
//   const PDFViver({
//     Key? key,
//     required this.pdftype,
//     required this.title,
//   }) : super(key: key);
//   final String pdftype;
//   final String title;
//
//   @override
//   State<PDFViver> createState() => _PDFViverState();
// }
//
// class _PDFViverState extends State<PDFViver> {
//   @override
//   initState() {
//     getPDF();
//     super.initState();
//   }
//
//   @override
//   dispose() {
//     try {
//       pdf!.clear();
//     } catch (r) {}
//     super.dispose();
//   }
//
//   bool isloading = true;
//   @override
//   Widget build(BuildContext context) {
//     Size sze = MediaQuery.of(context).size;
//     // EdgeInsets padd = MediaQuery.of(context).padding;
//     return isloading
//         ? Container(
//             height: sze.height,
//             width: sze.width,
//             color: Colors.white,
//             child: const Center(
//               child: CircularProgressIndicator(),
//             ),
//           )
//         : ListView(
//             physics: const NeverScrollableScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             children: [
//               // AnimatedContainer(
//               //   duration: Duration(milliseconds: 500),
//               //   height: sze.height,
//               //   width: isexpanded ? sze.width * .75 : 0,
//               //   child: Material(
//               //     child: Column(
//               //       children: [
//               //         Container(
//               //           height: padd.top,
//               //           color: Colors.transparent,
//               //         ),
//               //
//               //         Container(
//               //             height: sze.height * .25,
//               //             decoration: BoxDecoration(
//               //               color: Colors.white,
//               //               //border: Border(bottom: BorderSide(),right: BorderSide())
//               //             ),
//               //             child: Stack(
//               //               children: [Image.asset('assets/images/hga.jpg')],
//               //             )), //Header
//               //
//               //         Expanded(
//               //           child: Container(
//               //               decoration: BoxDecoration(
//               //
//               //                 // border: Border(right: BorderSide(width: 1))
//               //               ),
//               //               child: ListView(
//               //                 children: [
//               //                   ListTile(
//               //                     leading: Icon(Icons.home),
//               //                     title: Text('Home'),
//               //                     onTap: () async {
//               //                       setState(() {
//               //                         isexpanded = false;
//               //                         controller.reverse();
//               //                       });
//               //                       var result =
//               //                       await Navigator.pushAndRemoveUntil(
//               //                           context,
//               //                           PageRouteBuilder(
//               //                               pageBuilder:
//               //                                   (context, anim1, anim2) {
//               //                                 return HomePage();
//               //                               },
//               //                               transitionDuration: Duration(
//               //                                   milliseconds: 500),
//               //                               transitionsBuilder: (context,
//               //                                   anim1, anim2, child) {
//               //                                 final offset =
//               //                                 Tween<double>(
//               //                                     begin: 0.0, end: 1);
//               //                                 final opacity =
//               //                                 anim1.drive(offset);
//               //                                 return FadeTransition(
//               //                                   opacity: opacity,
//               //                                   child: child,
//               //                                 );
//               //                               }),
//               //                               (route) => false);
//               //                       setState(() {
//               //                         // print("CartItem $cartitem");
//               //                         // print("Ras $result");
//               //                       });
//               //                     },
//               //                   ),
//               //                   ListTile(
//               //                     leading: Icon(Icons.format_list_bulleted),
//               //                     title: Text('Your cart'),
//               //                     trailing: cartitem.length > 0
//               //                         ? Container(
//               //                         padding: EdgeInsets.all(5),
//               //                         decoration: BoxDecoration(
//               //                             shape: BoxShape.circle,
//               //                             color: Colors.red),
//               //                         child: Text(
//               //                           "${cartitem.length}",
//               //                           style: TextStyle(
//               //                               fontSize: 12,
//               //                               color: Colors.white),
//               //                         ))
//               //                         : null,
//               //                     onTap: () async {
//               //                       setState(() {
//               //                         isexpanded = false;
//               //                         controller.reverse();
//               //                       });
//               //                       var result = await Navigator.push(
//               //                           context,
//               //                           PageRouteBuilder(
//               //                               pageBuilder:
//               //                                   (context, anim1, anim2) {
//               //                                 return ItemCart();
//               //                               },
//               //                               transitionDuration:
//               //                               Duration(milliseconds: 500),
//               //                               transitionsBuilder: (context,
//               //                                   anim1, anim2, child) {
//               //                                 final offset = Tween<double>(
//               //                                     begin: 0.0, end: 1);
//               //                                 final opacity =
//               //                                 anim1.drive(offset);
//               //                                 return FadeTransition(
//               //                                   opacity: opacity,
//               //                                   child: child,
//               //                                 );
//               //                               }));
//               //                       setState(() {
//               //                         // print("CartItem $cartitem");
//               //                         // print("Ras $result");
//               //                       });
//               //                     },
//               //                   ),
//               //                   ListTile(
//               //                     leading:
//               //                     Icon(Icons.format_list_numbered_rtl),
//               //                     title: Text('Your orders'),
//               //                     onTap: () async {
//               //                       setState(() {
//               //                         isexpanded = false;
//               //                         controller.reverse();
//               //                       });
//               //                       var result = await Navigator.push(
//               //                           context,
//               //                           PageRouteBuilder(
//               //                               pageBuilder:
//               //                                   (context, anim1, anim2) {
//               //                                 return OrderHistory();
//               //                               },
//               //                               transitionDuration:
//               //                               Duration(milliseconds: 500),
//               //                               transitionsBuilder: (context,
//               //                                   anim1, anim2, child) {
//               //                                 final offset = Tween<double>(
//               //                                     begin: 0.0, end: 1);
//               //                                 final opacity =
//               //                                 anim1.drive(offset);
//               //                                 return FadeTransition(
//               //                                   opacity: opacity,
//               //                                   child: child,
//               //                                 );
//               //                               }));
//               //                       setState(() {
//               //                         // print("CartItem $cartitem");
//               //                         // print("Ras $result");
//               //                       });
//               //                     },
//               //                   ),
//               //                   ListTile(
//               //                     leading: Icon(Icons.category_outlined),
//               //                     title: Text('Categories'),
//               //                   ),
//               //                   ...List.generate(
//               //                     categorylist.length,
//               //                         (index) {
//               //                       return Padding(
//               //                         padding:
//               //                         const EdgeInsets.only(left: 25.0),
//               //                         child: ListTile(
//               //                           leading: Icon(Icons.category_sharp),
//               //                           title: Text(
//               //                               '${categorylist[index]['Cate_Name']}'),
//               //                           onTap: () async {
//               //                             setState(() {
//               //                               isexpanded = false;
//               //                               controller.reverse();
//               //                             });
//               //                             var result = await Navigator.push(
//               //                                 context,
//               //                                 PageRouteBuilder(
//               //                                     pageBuilder: (context,
//               //                                         anim1, anim2) {
//               //                                       return SubCat(
//               //
//               //                                         selectedcat: index,
//               //
//               //                                       );
//               //                                     },
//               //                                     transitionDuration:
//               //                                     Duration(
//               //                                         milliseconds: 500),
//               //                                     transitionsBuilder:
//               //                                         (context, anim1, anim2,
//               //                                         child) {
//               //                                       final offset =
//               //                                       Tween<double>(
//               //                                           begin: 0.0,
//               //                                           end: 1);
//               //                                       final opacity =
//               //                                       anim1.drive(offset);
//               //                                       return FadeTransition(
//               //                                         opacity: opacity,
//               //                                         child: child,
//               //                                       );
//               //                                     }));
//               //                             setState(() {
//               //                               // print("CartItem $cartitem");
//               //                               // print("Ras $result");
//               //                             });
//               //                           },
//               //                         ),
//               //                       );
//               //                     },
//               //                   ),
//               //                   ListTile(
//               //                     leading: Icon(Icons.insert_drive_file_rounded),
//               //                     title: Text('Invoice'),
//               //                     onTap: (){
//               //                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Invoice()));
//               //                     },
//               //                   ),
//               //                   ListTile(
//               //                     leading: Icon(Icons.insert_drive_file_rounded),
//               //                     title: Text('Invoice(free)'),
//               //                     onTap: () {
//               //                       Navigator.push(
//               //                           context,
//               //                           MaterialPageRoute(
//               //                               builder: (context) => InvoiceFree()));
//               //                     },
//               //                   ),
//               //                 ],
//               //               )),
//               //         )
//               //       ],
//               //     ),
//               //   ),
//               // ),
//               SizedBox(
//                   height: sze.height,
//                   width: sze.width,
//                   child: Scaffold(
//                     appBar: AppBar(
//                       backgroundColor: ThemeService().headerColor,
//                       title: Text(
//                         widget.title,
//                         style: TextStyle(
//                           fontSize: Responsive.safeBlockVertical * 2.5,
//                           color:
//                               (ThemeService().headerColor.computeLuminance() >
//                                       .5
//                                   ? Colors.black
//                                   : Colors.white),
//                         ),
//                       ),
//                       // actions: [
//                       //   // TextButton(
//                       //   //   onPressed: () {},
//                       //   //   child: Row(
//                       //   //     children: [
//                       //   //       Icon(
//                       //   //         FontAwesomeIcons.wallet,
//                       //   //         color: Color(0xffC58C63),
//                       //   //         size: Responsive.safeBlockHorizontal * 3.5,
//                       //   //       ),
//                       //   //       const SizedBox(
//                       //   //         width: 5,
//                       //   //       ),
//                       //   //       Obx(() {
//                       //   //         return Text(
//                       //   //           '${_profileController.walletpoints}',
//                       //   //           style: TextStyle(
//                       //   //             // color: Colors.black,
//                       //   //               fontSize: Responsive.safeBlockHorizontal * 3.5,
//                       //   //               fontWeight: FontWeight.bold),
//                       //   //         );
//                       //   //       }),
//                       //   //       const SizedBox(
//                       //   //         width: 10,
//                       //   //       ),
//                       //   //     ],
//                       //   //   ),
//                       //   // )
//                       // ],
//                     ),
//
//                     body: SafeArea(
//                       child: PdfPreview(
//                         build: (form) => pdf!,
//                         pdfFileName:
//                             'menu_${DateFormat('yyyyMMdd').format(DateTime.now())}${widget.pdftype.toString().split('.').last}.pdf',
//                         dynamicLayout: true,
//                         initialPageFormat: PdfPageFormat.a4,
//                       ),
//                     ),
//
//                     // bottomNavigationBar: BottomAppBar(
//                     //   child: Row(
//                     //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     //     children: [
//                     //
//                     //       MaterialButton(
//                     //         onPressed: (){},
//                     //         disabledColor: Colors.grey,
//                     //         child: Text(
//                     //          "Print",
//                     //           style: TextStyle(
//                     //               color: Colors.white,
//                     //             fontWeight: FontWeight.bold),
//                     //         ),
//                     //         color: Colors.blue,
//                     //       ),
//                     //       MaterialButton(
//                     //         onPressed: download,
//                     //         disabledColor: Colors.grey,
//                     //         child: Text(
//                     //          "Save",
//                     //           style: TextStyle(
//                     //               color: Colors.white,
//                     //               fontWeight: FontWeight.bold),
//                     //         ),
//                     //         color: Colors.orange,
//                     //       ),
//                     //       MaterialButton(
//                     //         onPressed: (){
//                     //           Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context,anim1,anim2){
//                     //             return HomePage();
//                     //           }), (route) => false);
//                     //
//                     //         },
//                     //         disabledColor: Colors.grey,
//                     //         child: Text(
//                     //          "Home",
//                     //           style: TextStyle(
//                     //               color: Colors.white,
//                     //               fontWeight: FontWeight.bold),
//                     //         ),
//                     //         color: Colors.red,
//                     //       ),
//                     //
//                     //
//                     //     ],
//                     //
//                     //   ),
//                     // ),
//                   )),
//             ],
//           );
//   }
//
//   Uint8List? pdf;
//   getPDF() async {
//     try {
//       final response = await http.get(
//         Uri.parse(widget.pdftype),
//       );
//       pdf = response.bodyBytes;
//       // print("$pdf");
//     } catch (e) {
//       // print("Exception $e");
//     }
//
//     setState(() {
//       isloading = false;
//     });
//   }
//
//   // static getAction(pdfType, id) async {
//   //   var sp = await SharedPreferences.getInstance();
//   //   var data;
//   //   switch (pdfType) {
//   //     case pdftype.qoutation:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'quotation'
//   //       };
//   //       break;
//   //
//   //     case pdftype.pinvoice:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'PI'
//   //       };
//   //       break;
//   //
//   //     case pdftype.invoice:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'GSTINC'
//   //       };
//   //       break;
//   //     case pdftype.porder:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'Purchase_Order'
//   //       };
//   //       break;
//   //     case pdftype.purinvoice:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'Purchase_Inv'
//   //       };
//   //       break;
//   //     case pdftype.payin:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'PAYMENTIN'
//   //       };
//   //       break;
//   //     case pdftype.payout:
//   //       data = {
//   //         'action': 'GetInvoivePdf',
//   //         'InvoiceID': id,
//   //         'CMPID': sp.getString('comp_id'),
//   //         'FromPage': 'PAYMENTOUT'
//   //       };
//   //       break;
//   //     case pdftype.coldstore:
//   //       data = {
//   //         'action': 'ColdGatePassPDF',
//   //         'TableID': id,
//   //         'PDFType': 'english'
//   //       };
//   //       break;
//   //     case pdftype.coldstoreexit:
//   //       data = {
//   //         'action': 'ColdGatePassPDF',
//   //         'TableID': id,
//   //         'PDFType': 'ExitPass'
//   //       };
//   //       break;
//   //   }
//   //   log("Data $data");
//   //
//   //   return data;
//   // }
// }
