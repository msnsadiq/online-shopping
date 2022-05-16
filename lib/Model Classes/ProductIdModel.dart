/// id : 10
/// product_image : "bottle.jpg"
/// product_name : "Water Bottle"
/// price : "180"
/// description : "Insta lite Water bottle"

class ProductIdModel {
  ProductIdModel({
      int? id, 
      String? productImage, 
      String? productName, 
      String? price, 
      String? description,}){
    _id = id;
    _productImage = productImage;
    _productName = productName;
    _price = price;
    _description = description;
}

  ProductIdModel.fromJson(dynamic json) {
    _id = json['id'];
    _productImage = json['product_image'];
    _productName = json['product_name'];
    _price = json['price'];
    _description = json['description'];
  }
  int? _id;
  String? _productImage;
  String? _productName;
  String? _price;
  String? _description;

  int? get id => _id;
  String? get productImage => _productImage;
  String? get productName => _productName;
  String? get price => _price;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['product_image'] = _productImage;
    map['product_name'] = _productName;
    map['price'] = _price;
    map['description'] = _description;
    return map;
  }
  static List<ProductIdModel>listFromJson(List<dynamic>json){
    return json == null ? [] : json.map((value) => ProductIdModel.fromJson(value)).toList();
  }

}