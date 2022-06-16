import 'package:flutter/material.dart';

class Data {
  final LED = 0;
  final WATERPUMP = 1;

  var URL = 'ws://ec2-52-78-136-239.ap-northeast-2.compute.amazonaws.com:4650/farmuser';

  var ledStatus = 0;
}