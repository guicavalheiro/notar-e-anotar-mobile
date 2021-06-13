import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class SecondaryButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const SecondaryButtonWidget({
    Key key,
    @required this.text,
    @required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onClicked,
      color: primaryFaded,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Text(
        text,
        style: TextStyle(color: primaryDark, fontSize: 16),
      ),
    );
  }
}
