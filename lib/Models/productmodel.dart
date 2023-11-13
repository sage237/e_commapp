

class Product {
  Product({
    required this.itemId,
    required this.itemName,
    required this.itemDesc,
    required this.image,
    required this.price,
    required this.thumb,
    required this.rating,
    this.quantity

  });
  String rating;

  String itemId;
  String thumb;
  String itemName;
  String itemDesc;
  List image;
  String price;
int? quantity;

  toJson() =>{

    "itemId":itemId,
    "thumb":thumb,
    "itemName":itemName,
    "itemDesc":itemDesc,
    "image":image,
    "price":price,
    "quantity":quantity,

  };


}



