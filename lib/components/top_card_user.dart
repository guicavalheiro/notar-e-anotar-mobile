import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:notar_e_anotar_app/pages/registration_activity.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class TopCardUser extends StatelessWidget {
  final String name;
  final String subject;

  const TopCardUser({this.name, this.subject});

  @override
  Widget build(BuildContext context) {
    DateTime __data = new DateTime.now();
    return Container(
      padding: EdgeInsets.only(top: 8, bottom: 0, left: 24, right: 24),
      decoration: BoxDecoration(
          color: primaryFaded,
          boxShadow: cardBoxShadow,
          borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(25),
              bottomEnd: Radius.circular(25))),
      alignment: Alignment.center,
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.25,
      child: SafeArea(
        child: SizedBox(
          child: Container(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: [
                      Container(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          foregroundImage: AssetImage('images/avatar.png'),
                          radius: 40,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text.rich(
                              TextSpan(
                                text: 'Olá,',
                                style:
                                    TextStyle(color: darkGreen, fontSize: 20),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' $name',
                                    style: TextStyle(
                                        color: darkGreen,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              "$subject",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 15),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationActivity())),
                        child: Container(
                          height: 80,
                          width: 70,
                          decoration: BoxDecoration(
                              color: primary,
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            //mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat("dd").format(__data),
                                    style: TextStyle(
                                      fontSize: 30,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    DateFormat("EEE", "pt_BR").format(__data),
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
