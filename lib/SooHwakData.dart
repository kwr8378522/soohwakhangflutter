import 'package:intl/intl.dart';

class SooHwakData {

  DateTime date = DateFormat("yyyy-MM-dd hh:mm").parse('2022-01-01 00:00');
  var temperature = 30;
  var humid = 50;
  var soilMoisture = 700;

  SooHwakData(this.date, this.temperature, this.humid, this.soilMoisture);
}