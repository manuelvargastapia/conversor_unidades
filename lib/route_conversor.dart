import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:conversor_unidades/unit.dart';

/// Pantalla donde el usuario puede introducir cantidades para convertir.
/// De momento, solo despliega una lista de units a modo de prueba.
/// Es responsable de la UI en el destino de las rutas.

class RouteConversor extends StatelessWidget {

  final String nombre;
  final Color color;
  final List<Unit> units;

  /// Esta clase requiere que todos sus argumentos no sean null.
  const RouteConversor({
    @required this.nombre,
    @required this.color,
    @required this.units,
  })  : assert(nombre != null),
        assert(color != null),
        assert(units != null);

  ///Configuración de ListView que muestra los ítems de la categoría
  @override
  Widget build(BuildContext context) {

    // Placeholder para units de prueba
    final widgetsUnit = units.map((Unit unit) {
      return Container(
        color: color,
        margin: EdgeInsets.all(8.0),
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Text(
              unit.nombre,
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'Conversion: ${unit.conversion}',
              style: Theme.of(context).textTheme.subhead,
            ),
          ],
        ),
      );
    }).toList();

    return ListView(
      children: widgetsUnit,
    );
  }
}