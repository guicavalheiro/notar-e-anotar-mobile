import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notar_e_anotar_app/components/task_card.dart';
import 'package:notar_e_anotar_app/components/weekdays_card.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeeklyRoutineRegistration extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text('1ª Semana'),
      ),
      backgroundColor: backgroundGrey,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WeekdaysCard(),
          Padding(
            padding: EdgeInsets.only(top: 16, left: 16, right: 16, bottom: 5),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('TAREFAS E DESAFIOS',
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline5),
                Container(
                    height: 40,
                    decoration: BoxDecoration(
                        gradient: mainGreenGradient,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.add),
                        label: Text('CRIAR'),
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)))),
                        onPressed: () => print('Tapped add button!')))
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: kBottomSheetHeight),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                child:
                    ListBody(children: List.generate(7, (index) => TaskCard())),
              ),
            ),
          )
        ],
      ),
      bottomSheet: Container(
        decoration: BoxDecoration(
            border: Border.all(color: innerShadowColor, width: 1),
            boxShadow: bottomSheetShadow),
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(136, 44)),
              ),
              child: Text('CANCELAR'),
              onPressed: () => print('Tapped Cancel button!'),
            ),
            Container(
              width: 136,
              height: 44,
              decoration: BoxDecoration(
                  gradient: mainGreenGradient,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.transparent),
                ),
                child: Text('CONFIRMAR'),
                onPressed: () => print('Tapped Confirm button!'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
