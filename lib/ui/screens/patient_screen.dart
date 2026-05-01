import 'package:flutter/material.dart';
import 'package:group_list_view/group_list_view.dart';

class PatientScreen extends StatelessWidget {
  const PatientScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Map<String, List> elementos = {
    'Equipo A': ['blabla1', 'blabla2', 'blabla3'],
    'Equipo B': ['blabla4', 'blabla5', 'blabla6'],
    };

    return Scaffold(
      appBar: AppBar(
        //title: Text("Asistencia"),
        flexibleSpace: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/images/banner3.jpg',
              fit: BoxFit.cover,
            ),
          ],
        ),
        toolbarHeight: 80, //tamaño barra
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GroupListView(
          sectionsCount: elementos.keys.toList().length,

          countOfItemInSection: (int section) {
            return elementos.values.toList()[section].length;
          },

          //items de la lista
          itemBuilder: (BuildContext context, IndexPath index) {
            return Text(
              elementos.values.toList()[index.section][index.index],
              style: TextStyle(color: Colors.black, fontSize: 18),
            );
          },
          
          //header de la lista
          groupHeaderBuilder: (BuildContext context, int section) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              child: Text(
                elementos.keys.toList()[section],
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
              ),
            );
          },

          separatorBuilder: (context, index) => SizedBox(height: 10),
          sectionSeparatorBuilder: (context, section) => SizedBox(height: 10),
        ),
      ),
      
    );
  }
}