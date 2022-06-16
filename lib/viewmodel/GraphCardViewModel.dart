import 'package:intl/intl.dart';
import 'package:soohwakhangflutter/SooHwakData.dart';

class GraphCardViewModel {

  List<SooHwakData> dataList = <SooHwakData>[
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-01 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-01 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-01 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-01 18:00"), 32, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-02 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-02 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-02 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-02 18:00"), 32, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-03 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-03 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-03 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-03 18:00"), 32, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-04 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-04 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-04 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-04 18:00"), 32, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-05 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-05 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-05 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-05 18:00"), 32, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-06 00:00"), 30, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-06 06:00"), 29, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-06 12:00"), 28, 50, 700),
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-06 18:00"), 32, 50, 700),
  ];

  var title = "title";
  var labelFormat = '{value}°C';
}