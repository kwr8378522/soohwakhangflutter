import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/viewmodel/InfoCardViewModel.dart';

class InfoCard extends StatefulWidget {
  const InfoCard({Key? key, required this.viewModel}) : super(key: key);

  final InfoCardViewModel viewModel;

  @override
  State<InfoCard> createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[300],
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 6,
            spreadRadius: 4,
            color: Color.fromARGB(20, 0, 0, 0),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          renderTitleStatus(widget.viewModel),
          renderText(widget.viewModel)
        ],
      ),
    );
  }
}

Widget renderTitleStatus(InfoCardViewModel viewModel) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 8)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  viewModel.title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
              ],
            ),
          ],
        ),
        Text(
          viewModel.status,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF999999),
          ),
        ),
      ],
    ),
  );
}

Widget renderText(InfoCardViewModel viewModel) {
  return Container(
    margin: EdgeInsets.only(top: 16, bottom : 16),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          viewModel.text,
          style: TextStyle(
            fontSize: 13,
            color: Color(0xFF333333),
          ),
        ),
      ],
    ),
  );
}
