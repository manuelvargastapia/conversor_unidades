import 'package:flutter/material.dart';
import 'unit.dart';

class ConverterRoute extends StatelessWidget{

  final String nombre;
  final Color color;
  final List<Unit> units;

  const ConverterRoute({
    @required this.nombre,
    @required this.color,
    @required this.units,
  }) :  assert(nombre != null),
        assert(color != null),
        assert(units != null);

  @override
  Widget build(BuildContext context) {

    final widgetsUnit = units.map((Unit unit){

      // TODO: Set the color for this Container

      return Container(
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