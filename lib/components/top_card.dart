import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/weekday_tile.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/utils/constants.dart';

class TopCard extends StatelessWidget {
  final String title;

  const TopCard({this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 20, left: 24, right: 24),
      decoration: BoxDecoration(
          color: primary,
          boxShadow: cardBoxShadow,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(25),
              bottomEnd: Radius.circular(25))),
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: SafeArea(
          child: SizedBox(
        width: MediaQuery.of(context).size.width * 2 / 3,
        child: Text(
          '$title',
          textAlign: TextAlign.center,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headline3,
        ),
      )),
    );
  }
}
