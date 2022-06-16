import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/viewmodel/ButtonCardViewModel.dart';
import 'package:soohwakhangflutter/viewmodel/InfoCardViewModel.dart';
import 'package:soohwakhangflutter/viewmodel/TitleItemViewModel.dart';
import 'package:soohwakhangflutter/viewmodel/UpdateButtonCardViewModel.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'dart:convert';

import 'data.dart';

class Manager {

  var titleItemViewModel = TitleItemViewModel();

  var updateInfoViewModel = UpdateButtonCardViewModel();

  var tempuratureViewModel = InfoCardViewModel();
  var humidViewModel = InfoCardViewModel();
  var soilMoistureViewModel = InfoCardViewModel();

  var ledViewModel = ButtonCardViewModel();
  var waterpumpViewModel = ButtonCardViewModel();

  var data = Data();

  WebSocketChannel? channel;
  bool isWebSocketRunning = false;

  Manager() {
    updateInfoViewModel.title = "서버";
    updateInfoViewModel.buttonText = "정보 받아오기";
    updateInfoViewModel.buttonIcon = Icons.cached;
    updateInfoViewModel.description = "서버로부터 최신 정보를 받아올 수 있어요.";
    updateInfoViewModel.setCallback(updateInfoButtonCallback);

    tempuratureViewModel.title = "온도";
    tempuratureViewModel.status = "알 수 없음";
    tempuratureViewModel.description = "온도는 식물에게 중요한 요소에요.\n"
        "온도는 식물의 탄소동화작용, 호흡작용, 증산 작용 등 생리적 작용에 영향을 준답니다.\n"
        "지금 바로 온도 정보를 가져와서 수확행 AI 진단을 받아보세요!";

    humidViewModel.title = "습도";
    humidViewModel.status = "알 수 없음";
    humidViewModel.description = "습도도 온도 만큼이나 중요한 요소에요.\n"
        "식물은 수분의 흡수량과 잎에서 내보내는 증발량에 균형이 이루어짐으로써 정상적으로 자라게 되요.\n"
        "지금 바로 습도 정보를 수확행 HARDWARE로부터 가져와보세요!";

    soilMoistureViewModel.title = "토양 수분";
    soilMoistureViewModel.status = "알 수 없음";
    soilMoistureViewModel.description = "토양 수분 센서를 통해 토양의 수분 수치를 가져와요.\n"
        "지금 바로 토양 수분 정보를 수확행 HARDWARE로부터 가져와보세요!";

    ledViewModel.title = "LED";
    ledViewModel.buttonIcon = Icons.lightbulb;
    ledViewModel.description = "온도가 낮을 때, LED를 켜면 온도를 상승시킬 수 있어요";
    ledViewModel.setCallback(ledButtonCallback);

    waterpumpViewModel.title = "워터펌프";
    waterpumpViewModel.buttonIcon = Icons.invert_colors;
    waterpumpViewModel.description = "습도가 낮을 때, waterpump를 켜면 습도를 높일 수 있어요";
    waterpumpViewModel.setCallback(waterpumpButtonCallback);
  }

  void updateInfoButtonCallback() {
    updateCurrentStatus();

    updateInfoViewModel.description = "서버로부터 정보를 받아왔어요!";
  }

  void ledButtonCallback() {
    activate(data.LED);
  }

  void waterpumpButtonCallback() {
    activate(data.WATERPUMP);
  }

  void updateCurrentStatus() {
    print("updateCurrentStatus");

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
    startStreamWithListener((event) {
      print(event);
      finishStream();
    });

    channel!.sink.add(
        jsonEncode({
          "type":"request",
          "message":"get_history",
          "payload":{
            "fromDate":"2022-01-01 00:00",
            "toDate":"2022-01-02 00:00"
          }
        })
    );

    // if (data.ledStatus == 1) {
    //   channel!.sink.add(
    //       jsonEncode({
    //         "type":"action",
    //         "message":"led",
    //         "payload":{
    //           "value":0
    //         }
    //       })
    //   );
    //   data.ledStatus = 0;
    // } else {
    //   channel!.sink.add(
    //       jsonEncode({
    //         "type":"action",
    //         "message":"led",
    //         "payload":{
    //           "value":1
    //         }
    //       })
    //   );
    //   data.ledStatus = 1;
    // }
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
      tempuratureViewModel.status = value['temperature'].toString();
      soilMoistureViewModel.status = value['soil_moisture'].toString();
      humidViewModel.status = value['humid'].toString();
      data.ledStatus = value['led'];
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