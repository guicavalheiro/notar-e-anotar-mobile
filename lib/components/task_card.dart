import 'package:flutter/material.dart';
import 'package:notar_e_anotar_app/styles/global_styles.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          'Limpar o quarto',
          style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontFamily: 'Baloo 2',
              color: primary,
              fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          'Especificações da tarefa aqui',
          style: Theme.of(context).textTheme.subtitle2,
        ),
        leading: CircleAvatar(
          backgroundColor: primaryAccent,
          child: Icon(
            Icons.clean_hands_outlined,
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          icon: Icon(Icons.more_vert),
          color: transparentGrey,
          onPressed: () => print('Tapped more button!'),
        ),
        contentPadding: EdgeInsets.only(bottom: 5, left: 16, right: 16),
        visualDensity: VisualDensity.standard,
        dense: false,
      ),
    );
  }
}
