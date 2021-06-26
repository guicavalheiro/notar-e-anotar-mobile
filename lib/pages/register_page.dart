import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/routine_period_selection.dart';
import 'package:notar_e_anotar_app/services/api.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/widgets/button_widget.dart';
import 'package:notar_e_anotar_app/utils/globals.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  TextEditingController nameParentController = TextEditingController();
  TextEditingController surnameParentController = TextEditingController();
  TextEditingController nameChildController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
              padding: EdgeInsets.only(left: 16, top: 42),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () => {Navigator.of(context).pop()},
                        child: Icon(
                          Icons.arrow_back,
                          color: primary,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text("Cadastro de usuário",
                          style: TextStyle(color: primary, fontSize: 24))
                    ],
                  ))),
          Padding(
              padding: EdgeInsets.only(left: 16, top: 24),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text("Faça seu cadastro abaixo",
                      style: TextStyle(color: grey, fontSize: 18)))),
          Expanded(
            child: Container(
                margin: const EdgeInsets.only(top: 4),
                color: Colors.transparent,
                child: Container(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        color: backgroundGrey,
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(24.0),
                          topRight: const Radius.circular(24.0),
                        )),
                    child: Form(
                        key: _formKey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 16),
                              TextFormField(
                                controller: nameParentController,
                                cursorColor: Theme.of(context).cursorColor,
                                style: TextStyle(color: primary),
                                decoration: InputDecoration(
                                  labelText: 'Nome do responsável',
                                  labelStyle: TextStyle(
                                    color: primary,
                                  ),
                                  filled: true,
                                  fillColor: primaryFaded,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primary),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: surnameParentController,
                                cursorColor: Theme.of(context).cursorColor,
                                style: TextStyle(color: primary),
                                decoration: InputDecoration(
                                  labelText: 'Sobrenome do responsável',
                                  labelStyle: TextStyle(
                                    color: primary,
                                  ),
                                  filled: true,
                                  fillColor: primaryFaded,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primary),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: nameChildController,
                                cursorColor: Theme.of(context).cursorColor,
                                style: TextStyle(color: primary),
                                decoration: InputDecoration(
                                  labelText: 'Nome do dependente',
                                  labelStyle: TextStyle(
                                    color: primary,
                                  ),
                                  filled: true,
                                  fillColor: primaryFaded,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primary),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  if (!RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value)) {
                                    return 'E-mail está incorreto.';
                                  }
                                  return null;
                                },
                                cursorColor: Theme.of(context).cursorColor,
                                style: TextStyle(color: primary),
                                decoration: InputDecoration(
                                  labelText: 'E-mail',
                                  labelStyle: TextStyle(
                                    color: primary,
                                  ),
                                  filled: true,
                                  fillColor: primaryFaded,
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: primary),
                                  ),
                                ),
                              ),
                              SizedBox(height: 12),
                              TextFormField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      value.length < 8) {
                                    return 'A senha deve ter no mínimo 8 caracteres';
                                  }
                                  return null;
                                },
                                obscureText: true,
                                cursorColor: Theme.of(context).cursorColor,
                                style: TextStyle(color: primary),
                                decoration: InputDecoration(
                                  labelText: 'Senha',
                                  suffixIcon: Icon(
                                    Icons.remove_red_eye,
                                    color: primary,
                                  ),
                                  labelStyle: TextStyle(
                                      color: Theme.of(context).primaryColor),
                                  filled: true,
                                  fillColor: primaryFaded,
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color:
                                              Theme.of(context).primaryColor)),
                                ),
                              ),
                              SizedBox(height: 16),
                            ],
                          ),
                        )))),
          ),
          Container(
            color: backgroundWhite,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: ButtonWidget(
                        text: 'Finalizar',
                        onClicked: () {
                          if (_formKey.currentState.validate()) {
                          createUser(
                            nameParentController.text,
                            surnameParentController.text,
                            nameChildController.text,
                            passwordController.text,
                            emailController.text
                          );
                          goToHomePage(context);
                          }
                        }),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<http.Response> createUser(String pFirstName, String pLastName,
      String pChildName, String pPwd, String pEmail) {
    User newUser = User(
      firstName: pFirstName,
      lastName: pLastName,
      childName: pChildName,
      password: pPwd,
      email: pEmail,
    );

    print(newUser.toJson());

    setCredentials(pEmail, pPwd);

    return http.post(
      Uri.parse('http://54.144.31.34/api/user/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(newUser.toJson()),
    );
  }

  void goToHomePage(context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => RoutinePeriodSelection()));
}
