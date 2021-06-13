import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/routine_period_selection.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';
import 'package:notar_e_anotar_app/widgets/secondary_button.dart';

class LoginPage extends StatelessWidget {
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
                        onClicked: () => goToHomePage(context),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Não possui conta?   ",
                              style:
                                  TextStyle(color: primaryFaded, fontSize: 18)),
                          Text("Registre-se",
                              style: TextStyle(
                                  color: primaryFaded,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
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

  void goToHomePage(context) => Navigator.push(context,
      MaterialPageRoute(builder: (context) => RoutinePeriodSelection()));
}
