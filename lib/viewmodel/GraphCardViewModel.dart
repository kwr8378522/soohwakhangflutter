import 'package:intl/intl.dart';
import 'package:soohwakhangflutter/SooHwakData.dart';

class GraphCardViewModel {

  List<SooHwakData> dataList = <SooHwakData>[
    SooHwakData(DateFormat("yyyy-MM-dd kk:mm").parse("2022-01-01 00:00"), 30, 50, 700)
  ];

  double? height = 300;
}