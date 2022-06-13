import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/viewmodel/ButtonCardViewModel.dart';
import 'package:soohwakhangflutter/viewmodel/InfoCardViewModel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:convert';

import 'data.dart';

class Manager {

  var updateInfoViewModel = ButtonCardViewModel();
  var tempuratureViewModel = InfoCardViewModel();
  var humidViewModel = InfoCardViewModel();
  var ledViewModel = ButtonCardViewModel();
  var waterpumpViewModel = ButtonCardViewModel();

  var data = Data();

  WebSocketChannel? channel;
  bool isWebSocketRunning = false;

  Manager() {
    updateInfoViewModel.title = "서버";
    updateInfoViewModel.description = "서버로부터 최신 정보를 받아올 수 있어요.";

    tempuratureViewModel.title = "온도";
    tempuratureViewModel.status = "알 수 없음";
    tempuratureViewModel.description = "온도는 식물에게 중요한 요소에요.\n"
        "온도는 식물의 탄소동화작용, 호흡작용, 증산 작용 등 생리적 작용에 영향을 준답니다.\n"
        "지금 바로 온도 정보를 가져와서 수확행 AI 진단을 받아보세요!";

    humidViewModel.title = "습도";
    humidViewModel.status = "알 수 없음";
    humidViewModel.description = "습도도 온도 만큼이나 중요한 요소에요.\n "
        "식물은 수분의 흡수량과 잎에서 내보내는 증발량에 균형이 이루어짐으로써 정상적으로 자라게 되요.\n"
        "지금 바로 습도 정보를 수확행 HARDWARE로부터 가져와보세요!";

    ledViewModel.title = "LED";
    ledViewModel.description = "온도가 낮을 때, LED를 켜면 온도를 상승시킬 수 있어요";

    waterpumpViewModel.title = "Waterpump";
    waterpumpViewModel.description = "습도가 낮을 때, waterpump를 켜면 습도를 높일 수 있어요";
  }

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

      tempuratureViewModel.status = value['temperature'];
      humidViewModel.status = value['humid'];

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