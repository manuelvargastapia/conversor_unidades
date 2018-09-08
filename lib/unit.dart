import 'package:meta/meta.dart';

class Unit {
  final String nombre;
  final double conversion;

  const Unit({
    @required this.nombre,
    @required this.conversion,
  })  : assert(nombre != null),
        assert(conversion != null);

  Unit.fromJson(Map jsonMap)
      : nombre = jsonMap['nombre'],
        conversion = jsonMap['conversion'].toDouble(),
        assert(nombre != null),
        assert(conversion != null);
}
