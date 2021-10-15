import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/providers/menu_provider.dart';
import 'package:componentes/src/pages/utils/icono_string_util.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Componentes'),
        backgroundColor: Colors.green,
      ),
      body: _lista(),
    );
  }

  Widget _lista(){

   // print(menuProvider.opciones);
   /* menuProvider.cargarData().then((opciones){
      print('_lista');
      print(opciones);
    });*/

   return FutureBuilder(
     future: menuProvider.cargarData(),
     initialData: [],
     builder: ( context, AsyncSnapshot<List<dynamic>> snapshot){

       return ListView(
         children: _listaItems(snapshot.data, context),
       );
     },
   );

   /* return ListView(
      children: _listaItems(),
    );*/
  }

 List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
   /* return [
      ListTile(title: Text('Hola Mundo'),),
      Divider(),
      ListTile(title: Text('Hola Mundo'),)
    ];*/
   final List<Widget> opciones=[];
   data.forEach((opt){
     final widgetTemp=ListTile(
      title: Text(opt['texto']), 
       leading: getIcon(opt['icon']),
       trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black),
       onTap: (){

        Navigator.pushNamed(context, opt['ruta']);
        /*final route= MaterialPageRoute(
          builder: (context){
            return AlertPage();
          }
        );
        Navigator.push(context, route);*/
       },
     );
     opciones..add(widgetTemp)
     ..add(Divider());
   });
   return opciones;
 }
}