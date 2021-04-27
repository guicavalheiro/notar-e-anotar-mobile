import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/pages/routine_theme_selection.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutinePeriodSelection extends StatefulWidget {
  @override
  _RoutinePeriodSelectionState createState() => _RoutinePeriodSelectionState();
}

class _RoutinePeriodSelectionState extends State<RoutinePeriodSelection> {
  int _value = 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(
            'Monitoração',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('images/onboarding_blob_1@3x.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: kTitleTopPadding),
                  child: Center(
                      child: SizedBox(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    child: Text(
                      'Quantas semanas quer monitorar?',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  )),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Slider(
                        value: _value.toDouble(),
                        min: 4,
                        max: 16,
                        divisions: 16,
                        activeColor: Colors.teal,
                        //  inactiveColor: Colors,
                        label: '$_value',
                        onChanged: (double newValue) {
                          setState(() {
                            _value = newValue.round();
                          });
                        },
                        semanticFormatterCallback: (double newValue) {
                          return '${newValue.round()} week';
                        }),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 4 / 5,
                      child: Text(
                        "Explicação prévia e descrição se quiser por aqui.",
                        style: TextStyle(
                          fontSize: 20,
                          color: grey,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          width: double.infinity,
          height: 44,
          margin: EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
              gradient: mainGreenGradient,
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
            ),
            child: Text('CONFIRMAR'),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RoutineThemeSelection()));
            },
          ),
        ));
  }
}
