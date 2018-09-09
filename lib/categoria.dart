import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:conversor_unidades/route_conversor.dart';
import 'package:conversor_unidades/unit.dart';

final _alturaFila = 100.0;
final _borderRadius = BorderRadius.circular(_alturaFila / 2);

/// Widget para las cateorías de conversiones (Longitud, Masa, etc.).
///
/// Se compone de un Icon y un Text.
/// Al tocarlo, muetsra animación coloreada.

class Categoria extends StatelessWidget {
  final String nombre;
  final ColorSwatch color;
  final IconData icono;
  final List<Unit> units;

  /// Creación de categorías.
  ///
  /// La categoría guarda su nombre (ej: 'Longitud'), su color y su ícono

  // '@required' revisa si un parámetro es pasado o no (obliga a que sea
  // satisfecho con un argumento). Sin embargo, no evalúa si el argumento
  // es null, de ahí que se utilicen las sentencias 'assert'
  const Categoria({
    Key clave,
    @required this.nombre,
    @required this.color,
    @required this.icono,
    @required this.units,
  })  : assert(nombre != null),
        assert(color != null),
        assert(icono != null),
        assert(units != null),
        super(key : clave);

  /// Navegar hacia route_conversor.dart.
  /// El método crea nuevas rutas de acuerdo a propiedades de la categoría
  /// seleccionada (texto de AppBar, color, etc.).
  void _navegarARouteConversor(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute<Null>(
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
          body: RouteConversor(
            color: color,
            nombre: nombre,
            units: units,
          ),
        );
      },
    ));
  }

  /// Construir widget que muestra información de la categoría
  /// Esta info incluye el ícono, nombre y color.
  // El parámetro 'context' describe la ubicación de este widget en el tree.
  // Permite obtener los datos Theme del ancestro Theme más cercano en el tree.
  // Se obtiene el tema para texto 'display1'.
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _alturaFila,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: color,
          splashColor: color,
          onTap: () => _navegarARouteConversor(context), //Equiv: () { function(); }
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
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
