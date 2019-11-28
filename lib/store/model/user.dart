import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UserInfo {
  int id;
  String token;
  String phone;
  String nickName;
  int sex;
  String age;
  String provice;
  String city;
  String area;
  int videoTime;
  int integralNum;
  int giftNum;

  UserInfo(
      {this.id,
      this.token,
      this.phone,
      this.nickName,
      this.sex,
      this.age,
      this.provice,
      this.area,
      this.city,
      this.videoTime = 0,
      this.integralNum = 0,
      this.giftNum = 0});

  UserInfo.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        token = json['token'],
        videoTime = json['videoTime'],
        integralNum = json['integralNum'],
        giftNum = json['giftNum'],
        nickName = json['nickName'],
        sex = json['sex'],
        age = json['age'],
        provice = json['provice'],
        city = json['city'],
        area = json['area'],
        phone = json['phone'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'token': token,
        'phone': phone,
        'nickName': nickName,
        'sex': sex,
        'age': age,
        'provice': provice,
        'city': city,
        'area': area,
        'videoTime': videoTime,
        'integralNum': integralNum,
        'giftNum': giftNum,
      };
}

class UserModel extends UserInfo with ChangeNotifier {
  UserInfo _userInfo = UserInfo(nickName: '游客');

  String _dataUrl = "https://reqres.in/api/users?per_page=20";
  String _jsonResonse = "";
  bool _isFetching = false;
  bool _isLoginIn = false; // 是否登录
  String _address = ''; // 是否登录

  bool get isFetching => _isFetching;
  bool get isLoginIn => _isLoginIn;

  int get id => _userInfo.id;
  String get token => _userInfo.token;
  String get phone => _userInfo.phone;
  int get sex => _userInfo.sex;
  String get age => _userInfo.age;
  String get provice => _userInfo.provice;
  String get city => _userInfo.city;
  String get area => _userInfo.area;
  String get address => _userInfo.provice + _userInfo.city + _userInfo.area;
  String get nickName => _userInfo.nickName;
  int get integralNum => _userInfo.integralNum;
  UserInfo get userInfo => _userInfo;

  void setToken(token) {
    _userInfo.token = token;
    notifyListeners();
  }

  void setPhone(phone) {
    _userInfo.phone = phone;
    notifyListeners();
  }

  void setNickname(nickName) {
    _userInfo.nickName = nickName;
    notifyListeners();
  }

  void setSex(sex) {
    _userInfo.sex = sex;
    notifyListeners();
  }

  void setAge(age) {
    _userInfo.age = age;
    notifyListeners();
  }

  void setAddress({String provice, String city, String area}) {
    _userInfo.provice = provice;
    _userInfo.city = city;
    _userInfo.area = area;
    notifyListeners();
  }

  void setInfo(UserInfo userInfo) {
    _userInfo = userInfo;
    notifyListeners();
  }

  void clearInfo() {
    _userInfo = UserInfo();
    notifyListeners();
  }

  void setIsLoginIn(bool state) {
    _isLoginIn = state;
    notifyListeners();
  }

  Future<void> fetchData() async {
    _isFetching = true;
    notifyListeners();

    var response = await http.get(_dataUrl);
    if (response.statusCode == 200) {
      _jsonResonse = response.body;
    }

    _isFetching = false;
    notifyListeners();
  }

  String get getResponseText => _jsonResonse;

  List<dynamic> getResponseJson() {
    if (_jsonResonse.isNotEmpty) {
      Map<String, dynamic> json = jsonDecode(_jsonResonse);
      // print(json['data']['avatar']);
      return json['data'];
    }
    return null;
  }

  void setIntegralNum(integralNum) {
    _userInfo.integralNum = integralNum;
    notifyListeners();
  }
}
