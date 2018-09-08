import 'package:conversor_unidades/unit.dart';
import 'package:flutter/material.dart';
import 'package:conversor_unidades/category.dart';

const _categoryIcono = Icons.beach_access;
final _colorFondo = Colors.lightBlueAccent[100];

class CategoryRoute extends StatelessWidget {

  const CategoryRoute();

  static const _categoryNombres = <String>[
    'Longitud',
    'Área',
    'Volumen',
    'Masa',
    'Tiempo',
    'Memoria digital',
    'Energía',
    'Moneda',
  ];

  static const _coloresBase = <Color>[
    Colors.teal,
    Colors.orange,
    Colors.pinkAccent,
    Colors.blueAccent,
    Colors.yellow,
    Colors.greenAccent,
    Colors.purpleAccent,
    Colors.red,
  ];

  Widget _construirWidgetCategory(List<Widget> categorias) {

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => categorias[index],
      itemCount: categorias.length,
    );
  }

  List<Unit> _obtenerListaDeUnits(String nombreDeCategory) {
    return List.generate(10, (int numeroConversion) {
      numeroConversion += 1;
      return Unit(
        nombre: '$nombreDeCategory Unit $nombreDeCategory',
        conversion: numeroConversion.toDouble(),
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    final categorias = <Category>[];

    for (int i = 0; i < _categoryNombres.length; i++) {
      categorias.add(
        Category(
            nombre: _categoryNombres[i],
            icono: _categoryIcono,
            color: _coloresBase[i]),
            units: _obtenerListaDeUnits(_categoryNombres[i]),
      );
    }

    final listView = Container(
      color: _colorFondo,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _construirWidgetCategory(categorias),
    );

    final appBar = AppBar(
      centerTitle: true,
      backgroundColor: _colorFondo,
      elevation: 0.0,
      title: Text(
        'Conversor de Unidades',
        style: TextStyle(
          color: Colors.black,
          fontSize: 30.0,
        )
      ),
    );

    return Scaffold(
      backgroundColor: _colorFondo,
      appBar: appBar,
      body: listView,
    );
  }
}
