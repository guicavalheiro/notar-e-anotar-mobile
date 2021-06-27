import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/register_page.dart';
import 'package:notar_e_anotar_app/pages/routine_period_selection.dart';
import 'package:notar_e_anotar_app/services/api.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/utils/globals.dart';
import 'package:notar_e_anotar_app/widgets/secondary_button.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image(
              image: AssetImage('images/notar-e-anotar-logo.png'),
              width: 300,
              height: MediaQuery.of(context).size.height * 0.4,
              alignment: Alignment.center,
              fit: BoxFit.contain,
            ),
            Container(
              margin: const EdgeInsets.only(top: 48),
              color: Colors.transparent,
              child: Container(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(24.0),
                        topRight: const Radius.circular(24.0),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 48),
                      Text("Já sou cadastrado",
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      SizedBox(height: 16),
                      TextFormField(
                        cursorColor: Theme.of(context).cursorColor,
                        controller: emailController,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'E-mail',
                          labelStyle: TextStyle(
                            color: Colors.white,
                          ),
                          filled: true,
                          fillColor: primaryDark,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        obscureText: true,
                        controller: passwordController,
                        cursorColor: Theme.of(context).cursorColor,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          labelText: 'Senha',
                          suffixIcon: Icon(
                            Icons.remove_red_eye,
                            color: Colors.white,
                          ),
                          labelStyle: TextStyle(color: Colors.white),
                          filled: true,
                          fillColor: primaryDark,
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 4),
                      Align(
                          alignment: Alignment.topRight,
                          child: Text("Esqueci minha senha",
                              style: TextStyle(
                                  color: primaryFaded, fontSize: 18))),
                      SizedBox(height: 16),
                      SecondaryButtonWidget(
                        text: 'Entrar',
                        onClicked: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      RoutinePeriodSelection()));
                          if (emailController.text.isNotEmpty &&
                              passwordController.text.isNotEmpty) {
                            login(context, emailController.text,
                                passwordController.text);
                          }
                        },
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Não possui conta?   ",
                              style:
                                  TextStyle(color: primaryFaded, fontSize: 18)),
                          new GestureDetector(
                              onTap: () {
                                this.goToRegister(context);
                              },
                              child: Text(
                                "Registre-se",
                                style: TextStyle(
                                    color: primaryFaded,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                        ],
                      ),
                      SizedBox(height: 36)
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }

  void login(context, String pEmail, String pPassword) async {
    final loginParameters = {
      'username': pEmail,
      'password': pPassword,
    };

    setCredentials(pEmail, pPassword);

    final response = await http.get(
        Uri.http('54.144.31.34', '/api/weekly_routine/', loginParameters),
        headers: <String, String>{
          'Authorization': 'Basic ${getEncondedCredentials()}',
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      goToHomePage(context);
    }
  }

  void goToHomePage(context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => RoutinePeriodSelection()));

  void goToRegister(context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => RegisterPage()));
}
