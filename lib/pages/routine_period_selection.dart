import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/components/top_card.dart';
import 'package:notar_e_anotar_app/models/week_themes.dart';
import 'package:notar_e_anotar_app/pages/routine_theme_selection.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class RoutinePeriodSelection extends StatefulWidget {
  @override
  _RoutinePeriodSelectionState createState() => _RoutinePeriodSelectionState();
}
class _RoutinePeriodSelectionState extends State<RoutinePeriodSelection> {
  int _value = 4;
  int numberOfWeeks = 4;
  
  @override
  Widget build(BuildContext context) {
    WeekTheme.fetchSubjects();
    return Scaffold(
        appBar: AppBar(
          textTheme: Theme.of(context).textTheme,
          title: Text(
            'Monitoramento',
            style: TextStyle(color: Colors.white),
          ),
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        extendBodyBehindAppBar: true,
        body: Column(
          children: [
            TopCard(
              title: 'Quantas semanas quer monitorar?',
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 46),
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: darkestGreen,
                    inactiveTrackColor: primaryFaded,
                    trackShape: RoundedRectSliderTrackShape(),
                    trackHeight: 4.0,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
                    thumbColor: darkestGreen,
                    overlayColor: darkestGreen.withAlpha(32),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 12.0),
                    tickMarkShape: RoundSliderTickMarkShape(),
                    activeTickMarkColor: primaryFaded,
                    inactiveTickMarkColor: primaryAccent,
                    valueIndicatorShape: PaddleSliderValueIndicatorShape(),
                    valueIndicatorColor: darkestGreen,
                    valueIndicatorTextStyle: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  child: Slider(
                    value: _value.toDouble(),
                    semanticFormatterCallback: (double newValue) {
                      return '${newValue.round()} week';
                    },
                    min: 4,
                    max: 16,
                    divisions: 12,
                    label: '$_value',
                    onChanged: (double newValue) {
                      setState(() {
                        _value = newValue.round();
                        valueWeeks(_value);
                      });
                    },
                  ),
                ),
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
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ElevatedButton(
          child: Text('CONFIRMAR'),
          style: ButtonStyle(
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width - 64, 44)),
          ),
          onPressed: () async {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RoutineThemeSelection(
                          numberOfWeeks: numberOfWeeks,
                        )));
          },
        ));
  }

  void valueWeeks(value) {
    // valueWeek = value;
    numberOfWeeks = value;
  }

  void call() {
    WeekTheme.fetchSubjects();
  }
}
