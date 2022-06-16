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
          Container(
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
                          widget.viewModel.title,
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
                  setState(() {
                    widget.viewModel.onButtonClicked();
                  });
                },
                  icon: Icon(widget.viewModel.buttonIcon, size: 18),
                  label: Text(widget.viewModel.buttonText),
                  style: TextButton.styleFrom(
                    primary: Colors.green[200],
                    backgroundColor: Colors.green[400],),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom : 16),
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded( child :Text(
                  widget.viewModel.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.green[400],
                  ),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
