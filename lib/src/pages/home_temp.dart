import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {

  final opciones= ['Uno', 'Dos', 'Tres', 'Cuatro', 'Cinco'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componnetes Temp'),
      ),
      body: ListView(
        //children: _crearItems(),
        children: _crearItemsCorta(),
      ),
    );
  }

  List<Widget>_crearItems(){

    List<Widget> lista=new List<Widget>();
    for(var opt in opciones){
      final tempWidget = ListTile(
        title: Text(opt),
      );
      lista.add(tempWidget);
      lista.add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsCorta(){
    return opciones.map((item){
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(item + '!'),
            leading: Icon(Icons.power),
            trailing: Icon(Icons.arrow_forward),
            onTap: (){},
          ),
          Divider()
        ],
      );
    }).toList();
  }
}
