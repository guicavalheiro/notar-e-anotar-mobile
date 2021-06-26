import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notar_e_anotar_app/components/date_state_manager.dart';
import 'package:notar_e_anotar_app/components/task_card.dart';
import 'package:notar_e_anotar_app/components/weekdays_card.dart';
import 'package:notar_e_anotar_app/pages/home_page.dart';
import 'package:notar_e_anotar_app/services/api.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeeklyRoutineRegistration extends StatefulWidget {
  final RoutinePlan routinePlan;

  WeeklyRoutineRegistration({this.routinePlan});

  @override
  _WeeklyRoutineRegistrationState createState() =>
      _WeeklyRoutineRegistrationState();
}

class _WeeklyRoutineRegistrationState extends State<WeeklyRoutineRegistration> {
  static Map<int, List> daysMapping;
  RoutinePlan routinePlan;

  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  bool bCheckboxValue = false;
  final _formKey = GlobalKey<FormState>();

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isBottomCardOpen = false;
  List<TaskCard> sundayTasks = [];
  List<TaskCard> mondayTasks = [];
  List<TaskCard> tuesdayTasks = [];
  List<TaskCard> wednesdayTasks = [];
  List<TaskCard> thursdayTasks = [];
  List<TaskCard> fridayTasks = [];
  List<TaskCard> saturdayTasks = [];

  @override
  void initState() {
    super.initState();
    daysMapping = {
      0: sundayTasks,
      1: mondayTasks,
      2: tuesdayTasks,
      3: wednesdayTasks,
      4: thursdayTasks,
      5: fridayTasks,
      6: saturdayTasks
    };
    routinePlan = widget.routinePlan;
  }

  void addCard(String title, String description, bool isChallenge) {
    setState(() {
      daysMapping[dateStateManager.selectedDateIndex.value].add(TaskCard(
          title: title,
          description: description,
          challenge: isChallenge,
          callback: removeCard));
    });
  }

  void removeCard(TaskCard card) {
    setState(() {
      daysMapping[dateStateManager.selectedDateIndex.value].remove(card);
    });
  }

  void itemChange(bool val, StateSetter state) {
    setState(() {
      //use that state here
      bCheckboxValue = val;
    });
  }

  void changeSelectedDay(int dayNumber) {
    dateStateManager.selectedDateIndex.value = dayNumber;
    setState(() {});
  }

  WeeklyRoutine generateRoutineModel() {
    List<RoutineDay> routineDayList = [];
    for (int i = 0; i <= 6; i++) {
      List<Task> tasks = daysMapping[i].map((e) {
        return Task(
            name: e.title, challenge: e.challenge, description: e.description);
      }).toList();

      routineDayList.add(
          RoutineDay(date: DateTime.now(), chores: tasks, routineDate: []));
    }

    WeeklyRoutine wr = WeeklyRoutine(
        routinePlanId: routinePlan.id,
        subjectId: routinePlan.subjects[0].id,
        year: "Primeiro ano",
        weekNumber: 1,
        days: routineDayList);
    return wr;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text('1ª Semana'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeekdaysCard(title: "INÍCIO", caption: "", isGuardian: false),
            Padding(
              padding: EdgeInsets.only(top: 0, left: 16, right: 16, bottom: 5),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('TAREFAS E DESAFIOS',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline5),
                  ElevatedButton.icon(
                      icon: Icon(Icons.add),
                      label: Text('Criar'),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.white;
                            } else {
                              return primary;
                            }
                          }),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)))),
                      onPressed: () {
                        setState(() {
                          isBottomCardOpen = true;
                        });
                        this.scaffoldKey.currentState.showBottomSheet(
                          (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 16, horizontal: 32),
                                  height: 400,
                                  child: Center(
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.center,
                                      // mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        const Text('Nova tarefa',
                                            style: TextStyle(
                                                fontSize: 23,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.w600)),
                                        Form(
                                            key: _formKey,
                                            child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 0,
                                                    vertical: 16),
                                                child: Center(
                                                    child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: <Widget>[
                                                    TextFormField(
                                                      controller:
                                                          titleController,
                                                      style: TextStyle(
                                                          color:
                                                              backgroundWhite),
                                                      decoration:
                                                          InputDecoration(
                                                              labelStyle: TextStyle(
                                                                  color:
                                                                      backgroundWhite),
                                                              labelText:
                                                                  'Título',
                                                              filled: true,
                                                              fillColor:
                                                                  primaryAccent,
                                                              enabledBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            backgroundWhite),
                                                              ),
                                                              focusedBorder:
                                                                  UnderlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            backgroundWhite),
                                                              ),
                                                              contentPadding:
                                                                  const EdgeInsets
                                                                          .only(
                                                                      top: 7,
                                                                      left: 10,
                                                                      right: 10,
                                                                      bottom:
                                                                          0)),
                                                      validator: (value) {
                                                        if (value == null ||
                                                            value.isEmpty) {
                                                          return 'Obrigatório';
                                                        }
                                                        return null;
                                                      },
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 0,
                                                                vertical: 16),
                                                        child: TextFormField(
                                                          controller:
                                                              descController,
                                                          style: TextStyle(
                                                              color:
                                                                  backgroundWhite),
                                                          decoration:
                                                              InputDecoration(
                                                                  counterStyle: TextStyle(
                                                                      color:
                                                                          backgroundWhite,
                                                                      fontWeight: FontWeight
                                                                          .w300,
                                                                      fontSize:
                                                                          15),
                                                                  counterText:
                                                                      'Opcional',
                                                                  labelStyle:
                                                                      TextStyle(
                                                                          color:
                                                                              backgroundWhite),
                                                                  labelText:
                                                                      'Descrição',
                                                                  filled: true,
                                                                  fillColor:
                                                                      primaryAccent,
                                                                  enabledBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                backgroundWhite),
                                                                  ),
                                                                  focusedBorder:
                                                                      UnderlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                backgroundWhite),
                                                                  ),
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                              .only(
                                                                          top:
                                                                              7,
                                                                          left:
                                                                              10,
                                                                          right:
                                                                              10,
                                                                          bottom:
                                                                              0)),
                                                        )),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 0,
                                                              vertical: 0),
                                                      child: CheckboxListTile(
                                                          tileColor: primary,
                                                          checkColor: primary,
                                                          activeColor:
                                                              Colors.white,
                                                          title: const Text(
                                                              'É um desafio?',
                                                              style: TextStyle(
                                                                  color:
                                                                      backgroundWhite)),
                                                          value: bCheckboxValue,
                                                          onChanged:
                                                              (bool newValue) {
                                                            setState(() {
                                                              bCheckboxValue =
                                                                  newValue;
                                                            });
                                                          }),
                                                    ),
                                                    Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 2,
                                                                vertical: 0),
                                                        child: ElevatedButton(
                                                            style: ButtonStyle(
                                                              minimumSize: MaterialStateProperty.all(Size(
                                                                  MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .width -
                                                                      64,
                                                                  44)),
                                                              backgroundColor:
                                                                  MaterialStateProperty
                                                                      .all(
                                                                          primaryFaded),
                                                            ),
                                                            child: const Text(
                                                              'SALVAR',
                                                              style: TextStyle(
                                                                  color:
                                                                      primary,
                                                                  fontSize: 18,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                            onPressed: () {
                                                              print(
                                                                  titleController
                                                                      .text);
                                                              if (_formKey
                                                                  .currentState
                                                                  .validate()) {
                                                                isBottomCardOpen =
                                                                    false;
                                                                addCard(
                                                                    titleController
                                                                        .text,
                                                                    descController
                                                                        .text,
                                                                    bCheckboxValue);
                                                                titleController
                                                                    .clear();
                                                                descController
                                                                    .clear();
                                                                Navigator.pop(
                                                                    context);
                                                              }
                                                            })),
                                                  ],
                                                )))),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      })
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadiusDirectional.only(
                        topStart: Radius.circular(25),
                        topEnd: Radius.circular(25))),
                padding: EdgeInsets.only(top: 8, bottom: kBottomSheetHeight),
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: ValueListenableBuilder(
                      valueListenable: dateStateManager.selectedDateIndex,
                      builder: (context, value, widget) {
                        return ListBody(children: daysMapping[value]);
                      }),
                ),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: isBottomCardOpen
            ? null
            : ElevatedButton(
                child: Text('Confirmar'),
                style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all(
                        Size(MediaQuery.of(context).size.width - 64, 44)),
                    backgroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return primary;
                      } else {
                        return primaryFaded;
                      }
                    }),
                    foregroundColor:
                        MaterialStateProperty.resolveWith((states) {
                      if (states.contains(MaterialState.pressed)) {
                        return primaryDark;
                      } else {
                        return primary;
                      }
                    }),
                    overlayColor: MaterialStateProperty.all(Colors.white)),
                onPressed: () {
                  WeeklyRoutine model = generateRoutineModel();
                  // Post weekly routine data to back-end
                  WeeklyRoutineApi().addWeeklyRoutine(model);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              HomePage(weeklyRoutine: model)));
                }));
  }
}
