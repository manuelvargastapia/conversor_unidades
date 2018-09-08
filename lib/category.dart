import 'package:flutter/material.dart';
import 'converter_route.dart';
import 'unit.dart';

final _alturaRow = 100.0;
final _borderRadius = BorderRadius.circular(_alturaRow / 2);

class Category extends StatelessWidget {
  final String nombre;
  final Color color;
  final IconData icono;
  final List<Unit> units;

  const Category({
    Key key,
    @required this.nombre,
    @required this.icono,
    @required this.color,
    @required this.units,
  })  : assert(nombre != null),
        assert(icono != null),
        assert(color != null),
        assert(units != null),
        super(key: key);

  void _navegarAConverterRoute(BuildContext context) {
    // TODO: Using the Navigator, navigate to the [ConverterRoute]
    //The ConverterRoute should also have an AppBar,
    //the same color as the Category widget that was tapped.
    //The Title of the AppBar should be the name of the Category
    //Pass the name, color, and units to the ConverterRoute.
    //The background color of each unit should be the same as
    //the ConverterRoute's AppBar color.
    Navigator.of(context).push(
      MaterialPageRoute<Null>(
        builder: (BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              elevation: 1.0,
              title: Text(
                nombre,
                style: Theme.of(context).textTheme.display1,
              ),
              centerTitle: true,
              backgroundColor: color,
            ),
            body: ConverterRoute(
              nombre: nombre,
              color: color,
              units: units,
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _alturaRow,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () {
            print('Acabo de ser presionado');
          },
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    icono,
                    size: 60.0,
                  ),
                ),
                Center(
                  child: Text(
                    nombre,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
