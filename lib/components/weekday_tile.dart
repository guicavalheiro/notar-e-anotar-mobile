import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/date_state_manager.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeekdayTile extends StatefulWidget {
  final int dayNumber;
  final String dayName;
  final bool isLast;
  final bool isGuardian;

  WeekdayTile({this.dayNumber, this.dayName, this.isLast, this.isGuardian});

  @override
  _WeekdayTileState createState() => _WeekdayTileState();
}

class _WeekdayTileState extends State<WeekdayTile> {
  int dayNumber;
  String dayName;
  bool isLast;
  bool isGuardian;

  @override
  void initState() {
    super.initState();
    dayNumber = widget.dayNumber;
    dayName = widget.dayName;
    isLast = widget.isLast;
    isGuardian = widget.isGuardian;
  }

  void changeDay() {
    dateStateManager.selectedDateIndex.value = dayNumber;
  }

  Color colorForDays() {
    bool isToday =
        dateStateManager.selectedDateIndex.value == dayNumber ? true : false;
    if (isToday && isGuardian) {
      return primaryBlue;
    } else if (isToday && !isGuardian) {
      return primary;
    } else if (!isToday && isGuardian) {
      return lightPrimaryBlue;
    } else if (!isToday && !isGuardian) {
      return Colors.transparent;
    }
    return primary;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: dateStateManager.selectedDateIndex,
        builder: (context, value, widget) {
          bool isToday = value == dayNumber ? true : false;
          return Container(
            clipBehavior: Clip.none,
            margin: EdgeInsets.only(right: isLast ? 0 : 4),
            decoration: BoxDecoration(
                color: colorForDays(),
                borderRadius: BorderRadiusDirectional.all(Radius.circular(8))),
            child: ElevatedButton(
              style: ButtonStyle(
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return 3.0;
                  } else {
                    return 0.0;
                  }
                }),
              ),
              onPressed: () => changeDay(),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      '${dayNumber + 1}',
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
        });
  }
}
