import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:notar_e_anotar_app/components/top_card.dart';
import 'package:notar_e_anotar_app/models/week_themes.dart';
import 'package:notar_e_anotar_app/pages/weekly_routine_registration.dart';
import 'package:notar_e_anotar_app/services/api.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutinePlanRegistration extends StatefulWidget {
  final List<WeekTheme> weekThemes;

  const RoutinePlanRegistration({this.weekThemes});

  @override
  _RoutinePlanRegistrationState createState() =>
      _RoutinePlanRegistrationState();
}

class _RoutinePlanRegistrationState extends State<RoutinePlanRegistration> {
  @override
  int _value = 1;
  Future<http.Response> response;
  RoutinePlan routinePlan;

  Future<http.Response> createWeeklyRoutine() {
    int numberOfWeeks = widget.weekThemes.length;
    List<Subject> subjects = [];

    widget.weekThemes.forEach((element) {
      subjects.add(Subject(name: element.title));
    });

    routinePlan = RoutinePlan(numberOfWeeks: numberOfWeeks, subjects: subjects);

    print(routinePlan.toJson());

    return http.post(
      Uri.parse('http://54.144.31.34/api/routine_plan/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(routinePlan.toJson()),
    );
  }

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
      floatingActionButton: ElevatedButton(
          child: Text('CONFIRMAR'),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width - 64, 44)),
          ),
          onPressed: () {
            response = createWeeklyRoutine();
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WeeklyRoutineRegistration(routinePlan: routinePlan)));
          }),
    );
  }
}
