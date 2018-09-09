import 'package:flutter/material.dart';

import 'package:conversor_unidades/categoria.dart';
import 'package:conversor_unidades/unit.dart';

final _color_de_fondo = Colors.lightBlueAccent[100];

/// Pantalla de inicio de la app. Muestra un header y una lista de categorías.
class RouteCategoria extends StatefulWidget {

  const RouteCategoria();

  ///Implementación de método de StatefulWidget, el cual guarda un estado
  ///para potencialmente, ser modificado
  @override
  _StateRouteCategoria createState() => new _StateRouteCategoria();
}


///Clase State que gestiona dinámicamente la creación de ls ListView
///desplegada en la clase RouteCategoria
class _StateRouteCategoria extends State<RouteCategoria> {

  ///Variable que almacenará la lista creada dinámicamente
  final lista_de_categorias = <Categoria>[];
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

  ///La lista se creará al inicializar
  @override
  void initState() {
    super.initState();

    //Asignar nombre, color e ícono a cada categoría, luego meterla en la lista
    for (var i = 0; i < _nombres_de_categorias.length; i++) {
      lista_de_categorias.add(Categoria(
        nombre: _nombres_de_categorias[i],
        color: _colores_de_categorias[i],
        icono: Icons.cake,
        units: _obtenerListaUnits(_nombres_de_categorias[i]),
      ));
    }
  }

  ///Construye ListView y define número adecuado de filas para las categorías
  Widget _construirWidgetCategorias(List<Widget> categorias) {
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

  ///Construcción de la lista de categorías y despliegue de toda la pantalla
  @override
  Widget build(BuildContext context) {

    //Crear contenedor de la categoría, con su color, padding e incrustarle
    //la categoría como child
    final listView = Container(
      color: _color_de_fondo,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _construirWidgetCategorias(lista_de_categorias),
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
