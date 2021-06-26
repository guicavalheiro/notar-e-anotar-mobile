import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notar_e_anotar_app/components/activity_card.dart';
import 'package:notar_e_anotar_app/components/task_card.dart';
import 'package:notar_e_anotar_app/components/weekdays_card.dart';
import 'package:notar_e_anotar_app/pages/weekly_evaluation.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RegistrationActivity extends StatefulWidget {
  @override
  _RegistrationActivityState createState() => _RegistrationActivityState();
}

class _RegistrationActivityState extends State<RegistrationActivity> {
  bool isResponsable = false;
  List<ActivityCard> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks = [
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: false,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: false,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: true,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: true,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: false,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: true,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: true,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: false,
          isResponsable: isResponsable),
      ActivityCard(
          title: "FAZER O CAFÉ DA MANHÃ",
          description:
              "Esta semana crianca para desenvolve x ajuda a fazer y e o tratado f",
          isChallenge: false,
          isResponsable: isResponsable),
    ];
  }

  List<AppBar> bar = [
    AppBar(
      actions: [],
    )
  ];

  void addCard(String title, String description, bool isChallenge) {
    tasks.add(ActivityCard(title: title, description: description));
  }

  void removeCard(TaskCard card) {
    setState(() {
      tasks.remove(card);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        textTheme: Theme.of(context).textTheme,
        title: Text(
          '1ª Semana',
          style: TextStyle(color: isResponsable ? primaryBlue : primary),
        ),
        actions: [
          IconButton(
            color: isResponsable ? primaryBlue : primary,
            icon: Icon(Icons.rule),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => WeeklyEvaluation())),
          ),
          IconButton(
            color: isResponsable ? primaryBlue : primary,
            icon: Icon(Icons.cached),
            onPressed: () => setState(() => isResponsable = !isResponsable),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          WeekdaysCard(
              title: "ATIVIDADES DE HOJE",
              caption: "RESPONSÁVEL",
              isGuardian: isResponsable),
          SizedBox(height: 8),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: isResponsable ? primaryBlue : primary,
                  borderRadius: BorderRadiusDirectional.only(
                      topStart: Radius.circular(25),
                      topEnd: Radius.circular(25))),
              padding: EdgeInsets.only(top: 24),
              child: CustomScrollView(
                primary: false,
                slivers: <Widget>[
                  SliverPadding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    sliver: SliverGrid.count(
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      crossAxisCount: 2,
                      children: tasks,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
