



class Ctgrylst {
  Ctgrylst({
    required this.cateId,
    required this.cateName,
    required this.cateImage,
  });

  String cateId;
  String cateName;
  String cateImage;

  Map<String, dynamic> toMap() => {
        "Cate_Id": cateId,
        "Cate_Name": cateName,
        "Cate_Image": cateImage,
      };
}
