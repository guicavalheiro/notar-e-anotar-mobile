import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/weekday_tile.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/utils/constants.dart';

class WeekdaysCard extends StatelessWidget {
  const WeekdaysCard({
    Key key,
  }) : super(key: key);

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
            'INÍCIO',
            style: TextStyle(color: grey, fontSize: 18),
          ),
          Container(
            decoration: BoxDecoration(
              color: primaryFaded,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                bottomLeft: Radius.circular(15),
              ),
            ),
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Container(
                clipBehavior: Clip.none,
                child: Row(
                    children: List.generate(
                        7,
                        (index) => WeekdayTile(
                              dayNumber: index + 1,
                              dayName: shortWeekdaysName[index],
                              isLast: index == 6 ? true : false,
                              isToday: index == 0 ? true : false,
                            ))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
