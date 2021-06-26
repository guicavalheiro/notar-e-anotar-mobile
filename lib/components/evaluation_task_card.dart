import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class EvaluationTaskCard extends StatefulWidget {
  final String title;
  final String description;
  final bool challenge;
  final Function callback;
  bool hasGoodEvaluation;
  bool hasBadEvaluation;

  EvaluationTaskCard(
      {this.title,
      this.description,
      this.challenge,
      this.callback,
      this.hasGoodEvaluation,
      this.hasBadEvaluation});

  @override
  _EvaluationTaskCardState createState() => _EvaluationTaskCardState();
}

class _EvaluationTaskCardState extends State<EvaluationTaskCard> {
  String title;
  String description;
  bool challenge;
  bool hasGoodEvaluation;
  bool hasBadEvaluation;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
    challenge = widget.challenge;
    hasGoodEvaluation = widget.hasGoodEvaluation;
    hasBadEvaluation = widget.hasBadEvaluation;
  }

  void changeState() {
    challenge = true;
  }

  Color calculateColorForBackground() {
    if (!challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return Colors.white;
    } else if (challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return primaryFaded;
    } else if (hasGoodEvaluation) {
      return blueishGreen;
    } else {
      return washedRed;
    }
  }

  Color calculateColorForTitle() {
    if (!challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return primaryDark;
    } else if (challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return primaryDark;
    } else {
      return Colors.white;
    }
  }

  Color calculateColorForSubtitle() {
    if (!challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return Colors.grey;
    } else if (challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return primaryDark;
    } else {
      return Colors.white;
    }
  }

  Color calculateColorForGoodEvaluationButton() {
    if (!challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return blueishGreen;
    } else if (challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return blueishGreen;
    } else if (hasGoodEvaluation) {
      return darkBlueishGreen;
    } else if (hasBadEvaluation) {
      return darkWashedRed;
    }
  }

  Color calculateColorForBadEvaluationButton() {
    if (!challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return washedRed;
    } else if (challenge && !hasGoodEvaluation && !hasBadEvaluation) {
      return washedRed;
    } else if (hasBadEvaluation) {
      return darkWashedRed;
    } else if (hasGoodEvaluation) {
      return darkBlueishGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: calculateColorForBackground(),
      child: ListTile(
        title: Text(
          '$title',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'Baloo 2',
              color: calculateColorForTitle(),
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '$description',
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: calculateColorForSubtitle()),
        ),
        leading: CircleAvatar(
          backgroundColor: calculateColorForBadEvaluationButton(),
          child: IconButton(
              icon: Icon(Icons.close_rounded),
              color: challenge ? Colors.white : Colors.white,
              onPressed: () => setState(() {
                    hasBadEvaluation = !hasBadEvaluation;
                    hasGoodEvaluation = false;
                    // You guessed it! More nonsense code! Prost!!!!
                    widget.hasBadEvaluation = !widget.hasBadEvaluation;
                    widget.hasGoodEvaluation = false;
                  })),
        ),
        trailing: CircleAvatar(
          backgroundColor: calculateColorForGoodEvaluationButton(),
          child: IconButton(
              icon: Icon(Icons.done_rounded),
              color: challenge ? Colors.white : Colors.white,
              onPressed: () => setState(() {
                    hasGoodEvaluation = !hasGoodEvaluation;
                    hasBadEvaluation = false;
                    // After 01:30 of try and error I'm pretty sure this is the best I can do at the end of the semester. 
                    widget.hasGoodEvaluation = !widget.hasGoodEvaluation;
                    widget.hasBadEvaluation = false;
                  })),
        ),
        contentPadding: EdgeInsets.only(bottom: 5, left: 16, right: 16),
        visualDensity: VisualDensity.standard,
        dense: false,
      ),
    );
  }
}
