import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/routine_plan_registration.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutineThemeSelection extends StatefulWidget {
  @override
  _RoutineThemeSelectionState createState() => _RoutineThemeSelectionState();
}

class _RoutineThemeSelectionState extends State<RoutineThemeSelection> {
  bool checkBoxValue = false;

  List<String> themesList = [
    // 'Apresentação - Importância de monitorar a rotina',
    'Falar de Motivação', // 0
    'Aprender a relaxar', // 1
    'Organizando a Rotina', // 2
    'Habilidade social – Ser assertivo', // 3
    'Momento especial dos pais', // 4
    'Falando de emoções, pensamentos e comportamentos', // 5
    'Incentive a Gentileza', // 6
    'Vale uma recompensa', // 7
    'Solução de problemas', // 8
    'Favorecendo autonomia', // 9
    'A importância do elogio', // 10
    'As 05 linguagens do amor', // 11
    'Estilo de pais', // 12
    'Para cada reclamação mais gratidão', // 13
    // 'Visão e término',
  ];

  List<bool> themeCheck = List.filled(14, false, growable: false);

  void setThemeState(int index, bool value) {
    setState(() {
      this.themeCheck[index] = value;
    });
  }

  List<Widget> generateThemeList() {
    int index = 0;
    List<Widget> tileList = [];
    for (String theme in themesList) {
      tileList.add(CheckboxListTile(
          title: Text('$theme'),
          value: checkBoxValue,
          tileColor: Colors.white,
          checkColor: Colors.white,
          activeColor: primaryListTile,
          onChanged: (bool newValue) {
            setState(() {
              this.checkBoxValue = newValue;
            });
          }));
      index += 1;
    }
    return tileList;
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
        body: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topCenter,
                image: AssetImage('images/onboarding_blob_2@3x.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: kTitleTopPadding,
                        bottom: MediaQuery.of(context).size.height * 0.075),
                    child: Center(
                        child: SizedBox(
                      width: MediaQuery.of(context).size.width * 2 / 3,
                      child: Text(
                        'Quais suas prioridades?',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.headline3,
                      ),
                    )),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(boxShadow: listBoxShadow),
                      child: SingleChildScrollView(
                        child: ListBody(
                          children: generateThemeList(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
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
            )),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: double.infinity,
          height: 44,
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              gradient: mainGreenGradient,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text('CONFIRMAR'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutinePlanRegistration()));
            },
          ),
        ));
  }
}
