import 'package:flutter/material.dart';

class ButtonCardViewModel {

  var title = "title";
  var buttonIcon = Icons.build;
  var buttonText = "켜기";
  var description = "설명";

  late Function callback;

  void setCallback(callback) {
    this.callback = callback;
  }

  void onButtonClicked() {
    callback.call();
  }
}