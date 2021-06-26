import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/weekday_tile.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/utils/constants.dart';

class WeekdaysCard extends StatefulWidget {
  final String title;
  final String caption;
  final bool isGuardian;

  WeekdaysCard({this.title, this.caption, this.isGuardian});

  @override
  _WeekdaysCardState createState() => _WeekdaysCardState();
}

class _WeekdaysCardState extends State<WeekdaysCard> {
  List<WeekdayTile> weekdaysList;

  @override
  void initState() {
    super.initState();

    weekdaysList = List.generate(
        7,
        (index) => WeekdayTile(
              dayNumber: index,
              dayName: shortWeekdaysName[index],
              isLast: index == 6 ? true : false,
              isGuardian: widget.isGuardian,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 20, left: 24),
      color: Colors.white,
      alignment: Alignment.topLeft,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.title}',
            style: TextStyle(color: grey, fontSize: 18),
          ),
          widget.caption.isNotEmpty
              ? Text(
                  widget.isGuardian ? 'DEPENDENTE' : '${widget.caption}',
                  style: TextStyle(color: lighterGrey, fontSize: 14),
                )
              : SizedBox.shrink(),
          SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              color: widget.isGuardian ? lightPrimaryBlue : primaryFaded,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                  clipBehavior: Clip.none, child: Row(children: weekdaysList)),
            ),
          )
        ],
      ),
    );
  }
}
