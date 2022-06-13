import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/viewmodel/TitleItemViewModel.dart';

class TitleItem extends StatefulWidget {
  const TitleItem({Key? key, required this.viewModel}) : super(key: key);

  final TitleItemViewModel viewModel;

  @override
  State<TitleItem> createState() => _TitleItemState();
}

class _TitleItemState extends State<TitleItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      child: renderTitle(widget.viewModel)
    );
  }
}

Widget renderTitle(TitleItemViewModel viewModel) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      children: <Widget>[
        Row(
          children: <Widget>[
            Padding(padding: EdgeInsets.only(left: 8)),
            Text(
              viewModel.titleText,
              style: TextStyle(
                fontSize: 30,
                color: Colors.green[400],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
