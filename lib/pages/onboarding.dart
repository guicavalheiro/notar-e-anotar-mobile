import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:notar_e_anotar_app/pages/routine_period_selection.dart';
import 'package:notar_e_anotar_app/widgets/button_widget.dart';

class Onboarding extends StatefulWidget {
  Onboarding({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  static const customizedGreen = Color.fromRGBO(0x27, 0xA3, 0x9E, 1);

  void navigateToNextScreen() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => RoutinePeriodSelection()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            title: 'Título Aqui',
            bodyWidget: Image(
              image: AssetImage(
                'images/onboarding_image_1.png',
              ),
            ),
            footer: Text(
              'Lorem ipsum '
              'lorem ipsum',
              style: TextStyle(fontSize: 20),
            ),
            //image: buildImage('images/group_25.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Título Aqui',
            bodyWidget: Image(
              image: AssetImage('images/onboarding_image_2.png'),
            ),
            footer: Text(
              'Lorem ipsum '
              'lorem ipsum',
              style: TextStyle(fontSize: 20),
            ),
            //image: buildImage('images/group_26.png'),
            decoration: getPageDecoration(),
          ),
          PageViewModel(
            title: 'Título Aqui',
            bodyWidget: Image(
              image: AssetImage('images/onboarding_image_3.png'),
            ),
            footer: ButtonWidget(
              text: 'Começar App',
              onClicked: () => goToHome(context),
            ),

            //image: buildImage('images/family.png'),
            decoration: getPageDecoration(),
          ),
        ],
        done: Text(
          'Read',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: customizedGreen,
              fontSize: 15),
        ),
        onDone: () => goToHome(context),
        showSkipButton: true,
        skip: Text(
          'Pular',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: customizedGreen,
              fontSize: 15),
        ),
        next: Row(
          children: [
            Text(
              'Próximo',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: customizedGreen,
                  fontSize: 15),
            ),
            Icon(
              Icons.chevron_right_outlined,
              color: customizedGreen,
            ),
          ],
        ),
        dotsDecorator: getDotDecorator(),
        onChange: (index) => print('page $index selected'),
        globalBackgroundColor: Theme.of(context).primaryColor,
      ),
    );
  }

  DotsDecorator getDotDecorator() => DotsDecorator(
        color: Colors.grey[400],
        size: Size(10, 10),
        activeSize: Size(15, 15),
        activeColor: customizedGreen,
      );

  void goToHome(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => RoutinePeriodSelection()),
      );

  Widget buildImage(String path) =>
      Center(child: Image.asset(path, width: 500));

  PageDecoration getPageDecoration() => PageDecoration(
        titleTextStyle: TextStyle(
            fontSize: 35, fontWeight: FontWeight.bold, color: customizedGreen),
        bodyTextStyle: TextStyle(fontSize: 20),
        titlePadding: EdgeInsets.all(20).copyWith(top: 0),
        descriptionPadding: EdgeInsets.all(16).copyWith(bottom: 0),
        imagePadding: EdgeInsets.all(24),
        pageColor: Colors.white,
      );
}
