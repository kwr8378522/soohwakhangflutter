import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:soohwakhangflutter/viewmodel/ButtonCardViewModel.dart';

class ButtonCard extends StatefulWidget {
  const ButtonCard({Key? key, required this.viewModel}) : super(key: key);

  final ButtonCardViewModel viewModel;

  @override
  State<ButtonCard> createState() => _ButtonCardState();
}

class _ButtonCardState extends State<ButtonCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.green[200],
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

Widget renderTitleStatus(ButtonCardViewModel viewModel) {
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
                    color: Colors.green[600],
                  ),
                ),
              ],
            ),
          ],
        ),

        ElevatedButton.icon( onPressed: () {
          viewModel.onButtonClicked();
        },
          icon: Icon(viewModel.buttonIcon, size: 18),
          label: Text(viewModel.buttonText),
          style: TextButton.styleFrom(
            primary: Colors.green[200],
            backgroundColor: Colors.green[400],),
        ),
      ],
    ),
  );
}

Widget renderText(ButtonCardViewModel viewModel) {
  return Container(
    margin: EdgeInsets.only(top: 16, bottom : 16),
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          viewModel.description,
          style: TextStyle(
            fontSize: 13,
            color: Colors.green[400],
          ),
        ),
      ],
    ),
  );
}
