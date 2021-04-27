import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeekdayTile extends StatefulWidget {
  final int dayNumber;
  final String dayName;
  final bool isLast;
  final bool isToday;

  WeekdayTile({this.dayNumber, this.dayName, this.isLast, this.isToday});

  @override
  _WeekdayTileState createState() => _WeekdayTileState();
}

class _WeekdayTileState extends State<WeekdayTile> {
  int dayNumber;
  String dayName;
  bool isLast;
  bool isToday;

  @override
  void initState() {
    super.initState();
    dayNumber = widget.dayNumber;
    dayName = widget.dayName;
    isLast = widget.isLast;
    isToday = widget.isToday;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.none,
      margin: EdgeInsets.only(right: isLast ? 0 : 4),
      decoration: BoxDecoration(
          gradient: isToday ? lightGradient : null,
          boxShadow: isToday ? mainBoxShadow : null,
          borderRadius: BorderRadiusDirectional.all(Radius.circular(10))),
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return 3.0;
            } else {
              return 0.0;
            }
          }),
        ),
        onPressed: () => print('Tapped $dayNumber $dayName button!'),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 7),
          child: Column(
            children: [
              Text(
                '$dayNumber',
                style: isToday
                    ? Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.3)
                    : Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(height: 1.3, color: primaryAccent),
              ),
              Text(
                '$dayName',
                style: isToday
                    ? Theme.of(context).textTheme.bodyText2
                    : Theme.of(context)
                        .textTheme
                        .bodyText2
                        .copyWith(color: primaryAccent),
              )
            ],
          ),
        ),
      ),
    );
  }
}
