import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:convert';

import 'data.dart';

class Manager {

  var data = Data();

  WebSocketChannel? channel;
  bool isWebSocketRunning = false;

  void updateCurrentStatus() {
    startStreamWithListener((event) {
      print(event);
      updateText(event);
      finishStream();
    });

    channel!.sink.add(
        jsonEncode({
          "type":"request",
          "message":"get current data"}
        )
    );
  }

  void activate(type) {
    var messageString = "";
    if (type == data.LED) {
      messageString = "led";
    } else {
      messageString = "water";
    }

    startStreamWithListener((event) {
      print(event);
      finishStream();
    });

    if (data.ledStatus == 1) {
      channel!.sink.add(
          jsonEncode({
            "type":"action",
            "message":"led",
            "payload":{
              "value":0
            }
          })
      );
      data.ledStatus = 0;
    } else {
      channel!.sink.add(
          jsonEncode({
            "type":"action",
            "message":"led",
            "payload":{
              "value":1
            }
          })
      );
      data.ledStatus = 1;
    }
  }

  void startStreamWithListener(listener) async {
    if (isWebSocketRunning) {
      return;
    }

    channel = WebSocketChannel.connect(Uri.parse(data.URL),);
    channel!.stream.listen(listener,
      onDone: () {
        isWebSocketRunning = false;
      },
      onError: (err) {
        isWebSocketRunning = false;
      },
    );
  }

  void updateText(event) {
    var state = jsonDecode(event)['state'];
    var value = jsonDecode(event)['value'];

    if (state == "success") {
      data.serverStatusText = "서버 상태 : 연결됨";
      data.serverBackgroundColor = Colors.green[400];

      data.tempStatusText = "온도 : ${value['temperature']}";
      data.humidStatusText = "습도 : ${value['humid']}";

      if (value['led'] == 1) {
        data.ledStatusText = "상태 : 켜짐";
        data.ledStatus = 1;
      } else {
        data.ledStatusText = "상태 : 꺼짐";
        data.ledStatus = 0;
      }
    } else {
      data.serverStatusText = "서버 상태 : 연결 실패";
    }
  }

  void sendData() {
    channel!.sink.add(
        jsonEncode({
          "type":"request",
          "message":"get current data"}
        )
    );
  }

  void finishStream() {
    channel!.sink.close();
    isWebSocketRunning = false;
  }
}