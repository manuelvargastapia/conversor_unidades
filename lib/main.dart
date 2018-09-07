import 'package:flutter/material.dart';
import 'package:conversor_unidades/category_route.dart';

void main() {
  runApp(ConversorUnidades());
}

const _category_nombre = 'Icono';
const _category_icono = Icons.cake;
const _category_color = Colors.lightBlue;

class ConversorUnidades extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de Unidades',
      home: CategoryRoute(),  //Enlace a route con lista de íconos
    );
  }

}

