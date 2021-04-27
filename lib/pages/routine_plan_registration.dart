import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/weekly_routine_registration.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutinePlanRegistration extends StatefulWidget {
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
      body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('images/onboarding_blob_3@3x.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: SafeArea(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: kTitleTopPadding,
                    bottom: MediaQuery.of(context).size.height * 0.075),
                child: Center(
                    child: SizedBox(
                  width: MediaQuery.of(context).size.width * 2 / 3,
                  child: Text(
                    'Resumo de atividades',
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
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      boxShadow: listBoxShadow, color: Colors.white),
                  child: SingleChildScrollView(
                    child: ListBody(
                        children: themesList
                            .map((String theme) => ListTile(
                                  title: Text('$theme',
                                      style: TextStyle(
                                          color: primaryDark,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 18,
                                          fontFamily: 'Roboto')),
                                  leading: CircleAvatar(
                                    child: Text('$theme'.characters.first),
                                  ),
                                ))
                            .toList()),
                  ),
                ),
              ),
            ]),
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
                    builder: (context) => WeeklyRoutineRegistration()));
          },
        ),
      ),
    );
  }
}
