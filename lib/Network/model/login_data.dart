/// status : true
/// message : "تم تسجيل الدخول بنجاح"
/// data : {"id":57533,"name":"Abdelrahman ALgazzar","email":"algazz124ar.abdelrahman@gmail.com","phone":"15545698","image":"https://student.valuxapps.com/storage/uploads/users/FeRzDc6bqj_1691514416.jpeg","points":0,"credit":0,"token":"ozNpighKlV6E38MhpH36SicIIl5DEwavc8YZ7mmjmqQFYXdN1ihQd0EZT0sQOWprmI1850"}

class LoginData {
  LoginData({
      bool? status, 
      String? message, 
      Data? data,}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginData.fromJson(dynamic json) {
    _status = json['status'];
    _message = json['message'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _status;
  String? _message;
  Data? _data;
LoginData copyWith({  bool? status,
  String? message,
  Data? data,
}) => LoginData(  status: status ?? _status,
  message: message ?? _message,
  data: data ?? _data,
);
  bool? get status => _status;
  String? get message => _message;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['message'] = _message;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }

}

/// id : 57533
/// name : "Abdelrahman ALgazzar"
/// email : "algazz124ar.abdelrahman@gmail.com"
/// phone : "15545698"
/// image : "https://student.valuxapps.com/storage/uploads/users/FeRzDc6bqj_1691514416.jpeg"
/// points : 0
/// credit : 0
/// token : "ozNpighKlV6E38MhpH36SicIIl5DEwavc8YZ7mmjmqQFYXdN1ihQd0EZT0sQOWprmI1850"

class Data {
  Data({
      num? id, 
      String? name, 
      String? email, 
      String? phone, 
      String? image, 
      num? points, 
      num? credit, 
      String? token,}){
    _id = id;
    _name = name;
    _email = email;
    _phone = phone;
    _image = image;
    _points = points;
    _credit = credit;
    _token = token;
}

  Data.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
    _image = json['image'];
    _points = json['points'];
    _credit = json['credit'];
    _token = json['token'];
  }
  num? _id;
  String? _name;
  String? _email;
  String? _phone;
  String? _image;
  num? _points;
  num? _credit;
  String? _token;
Data copyWith({  num? id,
  String? name,
  String? email,
  String? phone,
  String? image,
  num? points,
  num? credit,
  String? token,
}) => Data(  id: id ?? _id,
  name: name ?? _name,
  email: email ?? _email,
  phone: phone ?? _phone,
  image: image ?? _image,
  points: points ?? _points,
  credit: credit ?? _credit,
  token: token ?? _token,
);
  num? get id => _id;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;
  String? get image => _image;
  num? get points => _points;
  num? get credit => _credit;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    map['image'] = _image;
    map['points'] = _points;
    map['credit'] = _credit;
    map['token'] = _token;
    return map;
  }

}