import 'package:flutter/material.dart';

class Data {
  final LED = 0;
  final WATERPUMP = 1;

  var URL = 'ws://121.136.192.61:4650/farmuser';

  var serverStatusText = "서버 상태 : 알 수 없음";
  var serverBackgroundColor = Colors.red[400];

  var tempStatusText = "온도 : 알 수 없음";

  var humidStatusText = "습도 : 알 수 없음";

  var ledStatusText = "상태 : 알 수 없음";
  var ledStatus = 0;
}