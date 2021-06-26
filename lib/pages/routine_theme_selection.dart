import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/top_card.dart';
import 'package:notar_e_anotar_app/models/week_themes.dart';
import 'package:notar_e_anotar_app/pages/routine_plan_registration.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:http/http.dart' as http;

class RoutineThemeSelection extends StatefulWidget {
  final int numberOfWeeks;

  const RoutineThemeSelection({this.numberOfWeeks});

  @override
  _RoutineThemeSelectionState createState() => _RoutineThemeSelectionState();
}

class _RoutineThemeSelectionState extends State<RoutineThemeSelection> {
  int numberOfThemesSelected = 0;

  List<WeekTheme> weekThemes = [
    WeekTheme('Falar de Motivação', false, "60bfec91cfdf7aed97ad2ab8"),
    WeekTheme('Aprender a relaxar', false, "60bfec91cfdf7aed97ad2ab9"),
    WeekTheme('Organizando a Rotina', false, "60bfec91cfdf7aed97ad2aba"),
    WeekTheme(
        'Habilidade social – Ser assertivo', false, "60bfec91cfdf7aed97ad2abb"),
    WeekTheme('Momento especial dos pais', false, "60bfec91cfdf7aed97ad2abc"),
    WeekTheme('Falando de emoções, pensamentos e comportamentos', false,
        "60bfec91cfdf7aed97ad2abd"),
    WeekTheme('Incentive a Gentileza', false, "60bfec91cfdf7aed97ad2abe"),
    WeekTheme('Vale uma recompensa', false, "60bfec91cfdf7aed97ad2abf"),
    WeekTheme('Solução de problemas', false, "60bfec91cfdf7aed97ad2ac0"),
    WeekTheme('Favorecendo autonomia', false, "60bfec91cfdf7aed97ad2ac1"),
    WeekTheme('A importância do elogio', false, "60bfec91cfdf7aed97ad2ac2"),
    WeekTheme('As 05 linguagens do amor', false, "60bfec91cfdf7aed97ad2ac3"),
    WeekTheme('Estilo de pais', false, "60bfec91cfdf7aed97ad2ac4"),
    WeekTheme(
        'Para cada reclamação mais gratidão', false, "60bfec91cfdf7aed97ad2ac5")
  ];

  List<WeekTheme> seletedWeekThemes = [
    WeekTheme('Apresentação - Importância de monitorar a rotina', true,
        "60bfec91cfdf7aed97ad2ab6"),
    WeekTheme('Visão e término', true, "60bfec91cfdf7aed97ad2ab7")
  ];

  List<bool> themeCheck = List.filled(14, false, growable: false);

  void setThemeState(int index, bool value) {
    setState(() {
      this.themeCheck[index] = value;
    });
  }

  bool fetched = false;
  List<Widget> generateThemeList() {
    // This monstrosity is necessary because without it the Theme list is fetched at every setState() call as per my understand.
    // TIP: don't try to understand this
    if (!fetched) {
      var th = WeekTheme.getThemes();
      if (th.length > 0) {
        print("fetched subjects!");

        weekThemes = th;
      }
      fetched = !fetched;
    }

    List<Widget> tileList = [];
    for (var i = 2; i < weekThemes.length - 1; i++) {
      var theme = weekThemes[i];
      tileList.add(CheckboxListTile(
          title: Text(theme.title),
          value: theme.isChecked,
          tileColor: Colors.white,
          checkColor: Colors.white,
          activeColor: primaryListTile,
          onChanged: (bool newValue) {
            setState(() {
              theme.isChecked = newValue;
              if (newValue) {
                numberOfThemesSelected = numberOfThemesSelected + 1;
              } else {
                numberOfThemesSelected = numberOfThemesSelected - 1;
              }
            });
          }));
    }
    return tileList;
  }

  checkForSelectedThemes() {
    seletedWeekThemes.removeRange(1, seletedWeekThemes.length - 1);
    for (WeekTheme theme in weekThemes) {
      if (theme.isChecked && !seletedWeekThemes.contains(theme)) {
        seletedWeekThemes.insert(seletedWeekThemes.length - 1, theme);
      }
    }
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    
    String text = "";
    if (widget.numberOfWeeks - 2 - numberOfThemesSelected > 0) {
      text = "Você tem que escolher exatamente ${widget.numberOfWeeks - 2} temas! Ainda faltam ${widget.numberOfWeeks - 2 - numberOfThemesSelected}.";
    } else {
      text = "Você tem que escolher exatamente ${widget.numberOfWeeks - 2} temas! Você escolheu ${(widget.numberOfWeeks - 2 - numberOfThemesSelected)* -1} a mais.";
    }
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> lista = generateThemeList();
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(
            'Seleção',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            TopCard(title: 'Quais suas prioridades?'),
            SizedBox(height: 32),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(boxShadow: listBoxShadow),
                child: SingleChildScrollView(
                  child: ListBody(
                    children: lista,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              flex: 2,
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "Escolha dois temas.\n O primeiro e o último são pré-definidos.",
                    style: TextStyle(
                      fontSize: 20,
                      color: grey,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
            ),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          child: Text('CONFIRMAR'),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width - 64, 44)),
          ),
          onPressed: () {
            if (numberOfThemesSelected == widget.numberOfWeeks - 2) {
              checkForSelectedThemes();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutinePlanRegistration(
                          weekThemes: seletedWeekThemes)));
            } else {
              showAlertDialog(context);
            }
          },
        ));
  }
}
