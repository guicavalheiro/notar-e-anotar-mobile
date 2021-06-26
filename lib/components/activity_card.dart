import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/weekday_tile.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/utils/constants.dart';

class ActivityCard extends StatelessWidget {
  final String title;
  final String description;
  final bool isChallenge;
  final bool isResponsable;

  const ActivityCard(
      {this.title, this.description, this.isChallenge, this.isResponsable});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          new BoxShadow(
            offset: Offset(0, 4),
            color: Colors.black54,
            blurRadius: 4.0,
          ),
        ],
      ),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        margin: EdgeInsets.zero,
        color: isChallenge ? primaryFaded : Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                      color: isChallenge ? lightPrimary : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          color: isChallenge ? lightPrimary : lightPrimary)),
                  child: Icon(
                    Icons.clean_hands_outlined,
                    color: isChallenge ? Colors.white : lightPrimary,
                    size: 20,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
              child: Text('$title',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      color: DarkPrimary,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      fontFamily: 'Roboto')),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 16),
              child: Text('$description',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      color: lightGrey,
                      fontWeight: FontWeight.w400,
                      fontSize: 10,
                      fontFamily: 'Roboto')),
            ),
          ],
        ),
      ),
    );
  }
}
