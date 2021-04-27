import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/widgets/button_widget.dart';

import 'onboarding.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('título aqui'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'HomePage',
              style: TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Voltar',
              onClicked: () => goToOnBoarding(context),
            ),
          ],
        ),
      ),
    );
  }

  void goToOnBoarding(context) => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => Onboarding()),
      );
}
