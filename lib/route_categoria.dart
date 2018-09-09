import 'package:flutter/material.dart';

import 'package:conversor_unidades/categoria.dart';
import 'package:conversor_unidades/unit.dart';

final _color_de_fondo = Colors.green[100];

/// Pantalla de inicio de la app. Muestra un header y una lista de categorías.
/// Es la responsable de la UI en el destino de las routes.

class RouteCategoria extends StatelessWidget {

  const RouteCategoria();

  static const _nombres_de_categorias = <String>[
    'Longitud',
    'Área',
    'Volumen',
    'Masa',
    'Tiempo',
    'Memoria Digital',
    'Energía',
    'Moneda',
  ];

  static const _colores_de_categorias = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  /// Define el número correcto de filas para la ListView, la cual a su vez
  /// es la encargada de la organización de las categorías.
  Widget _contruirWidgetsCategorias(List<Widget> categorias) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categorias[index],
      itemCount: categorias.length,
    );
  }

  /// Retorna una lista de Units (prototipos de prueba).
  List<Unit> _obtenerListaUnits(String nombreCategoria) {
    return List.generate(10, (int i) {
      i += 1;
      return Unit(
        nombre: '$nombreCategoria Unit $i',
        conversion: i.toDouble(),
      );
    });
  }

  ///Creación y despliegue de la lista de categorías en la pantalla inicial
  @override
  Widget build(BuildContext context) {

    final categorias = <Categoria>[]; //Lista de categorías vacía

    //Asignar nombre, color e ícono a cada categoría, luego meterla en la lista
    for (var i = 0; i < _nombres_de_categorias.length; i++) {
      categorias.add(Categoria(
        nombre: _nombres_de_categorias[i],
        color: _colores_de_categorias[i],
        icono: Icons.cake,
        units: _obtenerListaUnits(_nombres_de_categorias[i]),
      ));
    }

    //Crear contenedor de la categoría, con su color, padding e incrustarle
    //la categoría como child
    final listView = Container(
      color: _color_de_fondo,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _contruirWidgetsCategorias(categorias),
    );

    //Definir AppBar de la pantalla inicial de la app
    final appBar = AppBar(
      elevation: 0.0,
      title: Text(
        'Conversor de Unidades',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        ),
      ),
      centerTitle: true,
      backgroundColor: _color_de_fondo,
    );

    //Retornar Scaffold con estructura de la pantalla
    return Scaffold(
      appBar: appBar,
      body: listView,
    );
  }
}
