/// id : 7
/// product_image : "Watch2.jpeg"
/// product_name : "watch"
/// price : "890"
/// description : "nice watch"

class ProductReadModel {
  ProductReadModel({
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

  ProductReadModel.fromJson(dynamic json) {
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

  static List<ProductReadModel> listFromJson(List<dynamic> json){
    return json == null
        ? []
        : json.map((value) => ProductReadModel.fromJson(value)).toList();
  }

}