// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    this.cmpName,
    this.name,
    this.designation,
    this.email,
    this.mobile,
    this.whatsapp,
    this.alterNateNo,
    this.address,
    this.webSite,
    this.map,
    this.facebook,
    this.instagram,
    this.twitter,
    this.linkedIn,
    this.youtube,
    this.printest,
    this.image,
  });

  String? cmpName;
  String? name;
  String? designation;
  String? email;
  String? mobile;
  String? whatsapp;
  String? alterNateNo;
  String? address;
  String? webSite;
  String? map;
  String? facebook;
  String? instagram;
  String? twitter;
  String? linkedIn;
  String? youtube;
  String? printest;
  String? image;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        cmpName: json["CmpName"],
        name: json["Name"],
        designation: json["Designation"],
        email: json["Email"],
        mobile: json["Mobile"],
        whatsapp: json["Whatsapp"],
        alterNateNo: json["AlterNateNo"],
        address: json["Address"],
        webSite: json["WebSite"],
        map: json["Map"],
        facebook: json["Facebook"],
        instagram: json["Instagram"],
        twitter: json["Twitter"],
        linkedIn: json["LinkedIn"],
        youtube: json["Youtube"],
        printest: json["Printest"],
        image: json["Image"],
      );

  Map<String, dynamic> toJson() => {
        "CmpName": cmpName,
        "Name": name,
        "Designation": designation,
        "Email": email,
        "Mobile": mobile,
        "Whatsapp": whatsapp,
        "AlterNateNo": alterNateNo,
        "Address": address,
        "WebSite": webSite,
        "Map": map,
        "Facebook": facebook,
        "Instagram": instagram,
        "Twitter": twitter,
        "LinkedIn": linkedIn,
        "Youtube": youtube,
        "Printest": printest,
        "Image": image,
      };
}
