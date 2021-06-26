import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notar_e_anotar_app/components/evaluation_task_card.dart';
import 'package:notar_e_anotar_app/components/task_card.dart';
import 'package:notar_e_anotar_app/components/weekdays_card.dart';
import 'package:notar_e_anotar_app/pages/home_page.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeeklyEvaluation extends StatefulWidget {
  @override
  _WeeklyEvaluationState createState() => _WeeklyEvaluationState();
}

class _WeeklyEvaluationState extends State<WeeklyEvaluation> {
  TextEditingController titleController = TextEditingController();
  bool _isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isBottomCardOpen = false;

  void calculateWeek(BuildContext ctx) {
    var goodTasks = 0;

    for (var i = 0; i < tasks.length; i++) {
      if (tasks[i].hasGoodEvaluation == true) {
        goodTasks++;
      }
    }

    int result = ((goodTasks/tasks.length)*100).ceil();

    showAlertDialog(ctx, result);    
  }

  showAlertDialog(BuildContext ctx, int result) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage()));
      },
    );
    
    String title = "";
    String text = "";

    if (result >= 70) {
        title = "Parabéns!";
        text = "Você atingiu $result% dos seus objetivos para essa semana!\n\nContinue assim!";
    } else if (result >= 40) {
        title = "Legal!";
        text = "Você atingiu $result% dos seus objetivos para essa semana.\n\nVocê está quase lá!";
    } else {
        title = "Poxa!";
        text = "Você atingiu somente $result% dos seus objetivos para essa semana.\n\nVocê consegue melhorar!";
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(text),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: ctx,
      builder: (BuildContext ctx) {
        return alert;
      },
    );
  }

  List<EvaluationTaskCard> tasks = [
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: true,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: true,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: true,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    ),
    EvaluationTaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
      hasBadEvaluation: false,
      hasGoodEvaluation: false,
    )
  ];

  void addCard(String title, String description, bool isChallenge) {
    tasks.add(EvaluationTaskCard(
        title: title,
        description: description,
        challenge: isChallenge,
        callback: removeCard));
  }

  void removeCard(TaskCard card) {
    setState(() {
      tasks.remove(card);
    });
  }

  void itemChange(bool val, StateSetter state) {
    state(() {
      //use that state here
      _isSelected = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text('Avaliação Semanal'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 16, left: 26, right: 16, bottom: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Avalie sua semana atual',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline2)
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: lightGrey,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(25),
                        topEnd: Radius.circular(25))),
                padding: EdgeInsets.only(top: 8, bottom: kBottomSheetHeight),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: ListBody(children: tasks),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
            child: Text('Avaliar'),
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                  Size(MediaQuery.of(context).size.width - 64, 44)),
            ),
            onPressed: () {
              calculateWeek(context);
              print("pressionado");
            }));
  }
}
