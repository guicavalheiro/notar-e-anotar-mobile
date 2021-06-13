import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/top_card.dart';
import 'package:notar_e_anotar_app/pages/routine_plan_registration.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutineThemeSelection extends StatefulWidget {
  final int numberOfWeeks;

  const RoutineThemeSelection({this.numberOfWeeks});

  @override
  _RoutineThemeSelectionState createState() => _RoutineThemeSelectionState();
}

class WeekTheme {
  String title;
  bool isChecked;

  WeekTheme(String title, bool isChecked) {
    this.title = title;
    this.isChecked = isChecked;
  }
}

class _RoutineThemeSelectionState extends State<RoutineThemeSelection> {
  int numberOfThemesSelected = 0;

  List<WeekTheme> weekThemes = [
    WeekTheme('Falar de Motivação', false),
    WeekTheme('Aprender a relaxar', false),
    WeekTheme('Organizando a Rotina', false),
    WeekTheme('Habilidade social – Ser assertivo', false),
    WeekTheme('Momento especial dos pais', false),
    WeekTheme('Falando de emoções, pensamentos e comportamentos', false),
    WeekTheme('Incentive a Gentileza', false),
    WeekTheme('Vale uma recompensa', false),
    WeekTheme('Solução de problemas', false),
    WeekTheme('Favorecendo autonomia', false),
    WeekTheme('A importância do elogio', false),
    WeekTheme('As 05 linguagens do amor', false),
    WeekTheme('Estilo de pais', false),
    WeekTheme('Para cada reclamação mais gratidão', false)
  ];

  List<WeekTheme> seletedWeekThemes = [
    WeekTheme('Apresentação - Importância de monitorar a rotina', true),
    WeekTheme('Visão e término', true)
  ];

  List<bool> themeCheck = List.filled(14, false, growable: false);

  void setThemeState(int index, bool value) {
    setState(() {
      this.themeCheck[index] = value;
    });
  }

  List<Widget> generateThemeList() {
    List<Widget> tileList = [];
    for (WeekTheme theme in weekThemes) {
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
    for (WeekTheme theme in weekThemes) {
      if (theme.isChecked && !seletedWeekThemes.contains(theme)) {
        seletedWeekThemes.insert(1, theme);
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

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Atenção!"),
      content: Text(
          "Você tem que escolher exatamente ${widget.numberOfWeeks - 2} temas! Ainda faltam ${widget.numberOfWeeks - 2 - numberOfThemesSelected}!!"),
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
                    children: generateThemeList(),
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
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
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
