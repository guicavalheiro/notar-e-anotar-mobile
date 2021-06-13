import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/top_card.dart';
import 'package:notar_e_anotar_app/pages/weekly_routine_registration.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

import 'routine_theme_selection.dart';

class RoutinePlanRegistration extends StatefulWidget {
  final List<WeekTheme> weekThemes;

  const RoutinePlanRegistration({this.weekThemes});

  @override
  _RoutinePlanRegistrationState createState() =>
      _RoutinePlanRegistrationState();
}

class _RoutinePlanRegistrationState extends State<RoutinePlanRegistration> {
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

  @override
  int _value = 1;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          'Resumo',
          style: TextStyle(color: Colors.white),
        ),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(children: [
        TopCard(title: 'Resumo de atividades'),
        SizedBox(height: 32),
        Container(
          height: MediaQuery.of(context).size.height / 2,
          margin: EdgeInsets.symmetric(horizontal: 0),
          decoration: BoxDecoration(
              boxShadow: listBoxShadow, color: Colors.transparent),
          child: SingleChildScrollView(
            child: ListBody(
                children: widget.weekThemes
                    .map((WeekTheme theme) => Column(
                          children: [
                            SizedBox(height: 8),
                            SizedBox(
                              height: 67,
                              child: ListTile(
                                title: Text(theme.title,
                                    style: TextStyle(
                                        color: primaryDark,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                        fontFamily: 'Roboto')),
                                leading: Container(
                                  child: Image(
                                    image: AssetImage('images/teste.png'),
                                  ),
                                  width: 56.0,
                                  height: 56.0,
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(
                                          0, 3), // changes position of shadow
                                    )
                                  ]),
                                ),
                              ),
                            ),
                            Container(
                                child: Divider(),
                                margin: EdgeInsets.only(left: 72.0, right: 0.0))
                          ],
                        ))
                    .toList()),
          ),
        ),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        width: double.infinity,
        height: 44,
        margin: EdgeInsets.symmetric(horizontal: 24),
        decoration: BoxDecoration(
            gradient: mainGreenGradient,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: ElevatedButton(
            child: Text('CONFIRMAR'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 64, 44)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => WeeklyRoutineRegistration()));
            }),
      ),
    );
  }
}
