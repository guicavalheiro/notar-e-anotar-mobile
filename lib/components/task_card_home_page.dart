import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class TaskCardHomePage extends StatefulWidget {
  final String title;
  final String description;
  final bool challenge;
  final Function callback;

  TaskCardHomePage(
      {this.title, this.description, this.challenge, this.callback});

  //TaskCard({this.title, this.description, this.challenge, this.callback});

  @override
  _TaskCardHomePageState createState() => _TaskCardHomePageState();
}

class _TaskCardHomePageState extends State<TaskCardHomePage> {
  String title;
  String description;
  bool challenge;
  bool click = false;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
    challenge = widget.challenge;
  }

  Color addColor() {
    if (!click) {
      return greyCard;
    } else {
      return Colors.cyan.shade50;
    }
  }

  Icon returnIcon() {
    return Icon(
      Icons.check_circle,
      color: primary,
      size: 32,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListBody(
      // mainAxis: Axis.horizontal,
      //mainAxis: Axis.horizontal,
      children: [
        Card(
          elevation: 0,
          color: addColor(),
          child: ListTile(
              //tileColor:
              contentPadding: EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              title: Text(
                '$title',
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                    fontFamily: 'Baloo 2',
                    color: click ? primary : grey,
                    fontWeight: FontWeight.w600),
              ),
              subtitle: Text(
                '$description',
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(color: challenge ? primary : grey),
              ),
              trailing: click ? returnIcon() : null,
              visualDensity: VisualDensity.compact,
              dense: false,
              onTap: () {
                setState(() {
                  click = !click;
                  addColor();
                });
              }),
        ),
        Container(
            child: Divider(
          height: 8,
          endIndent: 16,
          indent: 16,
        ))
      ],
    );
  }
}
