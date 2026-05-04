import 'package:flutter/material.dart';


class WidgetListView extends StatelessWidget {
  const WidgetListView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          elevation: 6,
          child: ListTile(
          title: Text(
            "Nombre paciente",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            "Sesión pendiente",
            style: TextStyle(color: Colors.grey),
          ),
          tileColor: Colors.white,
          onTap: () {},
          leading: Icon(Icons.person),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}