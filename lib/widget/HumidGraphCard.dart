import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:soohwakhangflutter/SooHwakData.dart';
import 'package:soohwakhangflutter/viewmodel/GraphCardViewModel.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HumidGraphCard extends StatelessWidget {
  HumidGraphCard({Key? key, required this.viewModel}) : super(key: key);

  final GraphCardViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: viewModel.height,
        margin: EdgeInsets.all(16),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 6,
              spreadRadius: 4,
              color: Color.fromARGB(20, 0, 0, 0),
            ),
          ],
        ),
        child: SfCartesianChart(
            title: ChartTitle(
                text: '습도',
                textStyle: TextStyle(
                  color: Colors.green[400],
                  fontFamily: 'Jalnan',
                  fontSize: 14,
                )),
            // legend: Legend(isVisible: true),
            palette: <Color>[
              Colors.green[400]!,
            ],
            tooltipBehavior: TooltipBehavior(enable: true),
            backgroundColor: Colors.white,
            //Specifying date time interval type as hours
            primaryXAxis: DateTimeAxis(
                labelStyle: TextStyle(
                  color: Colors.green[400],
                  fontFamily: 'Jalnan',
                  fontSize: 12,
                ),
                majorGridLines: MajorGridLines(width: 0),
                edgeLabelPlacement: EdgeLabelPlacement.shift,
                dateFormat: DateFormat.Md().add_Hm(),
                intervalType: DateTimeIntervalType.auto),
            primaryYAxis: NumericAxis(
              labelFormat: '{value}%',
              labelStyle: TextStyle(
                color: Colors.green[400],
                fontFamily: 'Jalnan',
                fontSize: 12,
              ),
            ),
            series: <ChartSeries<SooHwakData, DateTime>>[
              LineSeries<SooHwakData, DateTime>(
                enableTooltip: true,
                dataSource: viewModel.dataList,
                xValueMapper: (SooHwakData soohwak, _) => soohwak.date,
                yValueMapper: (SooHwakData soohwak, _) => soohwak.humid,
                name: "습도",
              )
            ]));
  }
}