import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
class QrcodeInfo {
  String mac;
  String qrcode;
  int hotelId;
 

  QrcodeInfo(
      {this.mac,
      this.qrcode,
      this.hotelId});

  QrcodeInfo.fromJson(Map<String, dynamic> json)
      : mac = json['mac'],
        qrcode = json['qrcode'],
        hotelId = json['hotelId']
       ;

  Map<String, dynamic> toJson() => {
        'mac': mac,
        'qrcode': qrcode,
        'hotelId': hotelId,
      };
}

class QrcodeModel extends QrcodeInfo with ChangeNotifier {
  QrcodeInfo _qrcodeInfo = QrcodeInfo();

  String get mac => _qrcodeInfo.mac;
  String get qrcode => _qrcodeInfo.qrcode;
  int get hotelId => _qrcodeInfo.hotelId;
  QrcodeInfo get qrcodeInfo => _qrcodeInfo;
  
  void setMac(mac) {
    _qrcodeInfo.mac = mac;
    notifyListeners();
  }

  void serQrcode(qrcode) {
    _qrcodeInfo.qrcode = qrcode;
    notifyListeners();
  }

  void setHotelId(hotelId) {
    _qrcodeInfo.hotelId = hotelId;
    notifyListeners();
  }

  void setInfo(QrcodeInfo qrcodeInfo) {
    _qrcodeInfo = qrcodeInfo;
    notifyListeners();
  }
}
