import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:notar_e_anotar_app/components/task_card.dart';
import 'package:notar_e_anotar_app/components/weekdays_card.dart';
import 'package:notar_e_anotar_app/pages/home_page.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class WeeklyRoutineRegistration extends StatefulWidget {
  @override
  _WeeklyRoutineRegistrationState createState() =>
      _WeeklyRoutineRegistrationState();
}

class _WeeklyRoutineRegistrationState extends State<WeeklyRoutineRegistration> {
  TextEditingController titleController = TextEditingController();
  bool _isSelected = false;
  final _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool isBottomCardOpen = false;

  List<TaskCard> tasks = [
    TaskCard(
      title: "Limpar o quarto",
      description: "Especificações do desafio aqui",
      challenge: false,
    )
  ];

  void addCard(String title, String description, bool isChallenge) {
    tasks.add(TaskCard(
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
          title: Text('1ª Semana'),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            WeekdaysCard(),
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
                          addCard("Teste", "Teste de descrição", true);
                        });
                        this.scaffoldKey.currentState.showBottomSheet(
                          (BuildContext context) {
                            return StatefulBuilder(
                              builder: (context, setState) {
                                return Container(
                                  decoration: BoxDecoration(
                                      color: primary,
                                      borderRadius: new BorderRadius.only(
                                          topLeft: const Radius.circular(25.0),
                                          topRight:
                                              const Radius.circular(25.0))),
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
                                                          value: _isSelected,
                                                          onChanged:
                                                              (bool newValue) {
                                                            setState(() {
                                                              _isSelected =
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
                                                                titleController
                                                                    .clear();
                                                                isBottomCardOpen =
                                                                    false;
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
                  child: ListBody(children: tasks),
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
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage())),
              ));
  }
}
