/// id : 64
/// name : "msn"
/// email : "nannat@gmail.com"
/// password : "aaa"
/// user_img : null

class SignUpCreateModelClass {
  SignUpCreateModelClass({
      int? id, 
      String? name, 
      String? email, 
      String? password, 
      dynamic userImg,}){
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _userImg = userImg;
}

  SignUpCreateModelClass.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _password = json['password'];
    _userImg = json['user_img'];
  }
  int? _id;
  String? _name;
  String? _email;
  String? _password;
  dynamic _userImg;

  int? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get password => _password;
  dynamic get userImg => _userImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['password'] = _password;
    map['user_img'] = _userImg;
    return map;
  }

}