import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notar_e_anotar_app/components/task_card_home_page.dart';
import 'package:notar_e_anotar_app/components/top_card_user.dart';
import 'package:notar_e_anotar_app/pages/registration_activity.dart';
import 'package:notar_e_anotar_app/services/api.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class HomePage extends StatefulWidget {
  final WeeklyRoutine weeklyRoutine;

  HomePage({this.weeklyRoutine});

  List<TaskCardHomePage> generateTasksFor({int dayIndex}) {
    List tasks = weeklyRoutine.days[dayIndex].chores
        .map((Task task) => TaskCardHomePage(
            title: task.name,
            description: task.description,
            challenge: task.challenge))
        .toList();
    return tasks.sublist(0, tasks.length < 3 ? tasks.length : 3);
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String name = "Luana";
  final String subject = "Aprender a relaxar";

  List<TaskCardHomePage> tasks = [];
  List<TaskCardHomePage> tomorrowTasks = [];

  @override
  void initState() {
    super.initState();

    tasks = widget.generateTasksFor(dayIndex: 0);
    tomorrowTasks = widget.generateTasksFor(dayIndex: 1);

    TaskCardHomePage noDataCard = TaskCardHomePage(
      title: 'Não há atividades neste dia',
      description: 'Por favor, adicione atividades à rotina.',
      challenge: false,
    );
    if (tasks.isEmpty) {
      tasks.add(noDataCard);
    }
    if (tomorrowTasks.isEmpty) {
      tomorrowTasks.add(noDataCard);
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime __data = new DateTime.now();
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(50),
          child: Text(
            'Home',
            style: TextStyle(color: darkGreen),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          TopCardUser(name: this.name, subject: this.subject),
          Container(
            height: MediaQuery.of(context).size.height / 1.4,
            margin: EdgeInsets.symmetric(horizontal: 0),
            child: SingleChildScrollView(
              child: ListBody(
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 80),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Atividades de hoje\n',
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: DateFormat("EEEE", "pt_BR").format(__data),
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  for (TaskCardHomePage tks in tasks) tks,
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 30, top: 80),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Atividades de Amanhã\n',
                          style: TextStyle(color: Colors.black54, fontSize: 20),
                          children: <TextSpan>[
                            TextSpan(
                              text: DateFormat("EEEE", "pt_BR")
                                  .format(__data.add(Duration(days: 1))),
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  for (TaskCardHomePage tks in tomorrowTasks) tks,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void goToOnBoarding(context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RegistrationActivity()));
  }
}
