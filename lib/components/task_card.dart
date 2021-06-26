import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

import 'date_state_manager.dart';

class TaskCard extends StatefulWidget {
  final String title;
  final String description;
  final bool challenge;
  final Function callback;

  TaskCard({this.title, this.description, this.challenge, this.callback});

  @override
  _TaskCardState createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  String title;
  String description;
  bool challenge;

  @override
  void initState() {
    super.initState();
    title = widget.title;
    description = widget.description;
    challenge = widget.challenge;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: dateStateManager.selectedDateIndex,
      builder: (context, value, currentWidget) => Card(
        color: challenge ? primaryFaded : Colors.white,
        child: ListTile(
          title: Text(
            '$title',
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                fontFamily: 'Baloo 2',
                color: challenge ? primaryDark : primary,
                fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            '$description',
            style: Theme.of(context)
                .textTheme
                .subtitle2
                .copyWith(color: challenge ? primary : grey),
          ),
          leading: CircleAvatar(
            backgroundColor: challenge ? Colors.white : primaryAccent,
            maxRadius: 25.0,
            minRadius: 15.0,
            child: Text(
              title.characters.first.toUpperCase() ?? 'T',
              style: TextStyle(
                  color: challenge ? primaryAccent : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.5),
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.delete_sweep_outlined),
            color: transparentGrey,
            onPressed: () => widget.callback(this.widget),
          ),
          contentPadding: EdgeInsets.only(bottom: 5, left: 16, right: 16),
          visualDensity: VisualDensity.standard,
          dense: false,
        ),
      ),
    );
  }
}
