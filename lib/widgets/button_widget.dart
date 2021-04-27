import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onClicked,
      color: Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
  }
}
