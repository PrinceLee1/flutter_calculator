import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double textSize;
  final Function callback;
  const CalcButton(
      {Key key,
      this.fillColor,
      this.text,
      this.textSize = 25,
      this.callback,
      this.textColor = 0xFFFFFFFF})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 68,
        height: 68,
        child: FlatButton(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: Text(
            text,
            style: TextStyle(fontSize: textSize),
          ),
          onPressed: () {
            callback(text);
          },
          color: fillColor != null ? Color(fillColor) : null,
          textColor: Color(textColor),
        ),
      ),
    );
  }
}
