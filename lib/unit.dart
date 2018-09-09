import 'package:meta/meta.dart';

class Unit {
  final String nombre;
  final double conversion;

  /// Un objeto Unit almacena su nombre y factor de conversión.

  const Unit({
    @required this.nombre,
    @required this.conversion,
  })  : assert(nombre != null),
        assert(conversion != null);

  /// Creación de Unit mediante objeto JSON
  Unit.fromJson(Map jsonMap)
      : nombre = jsonMap['nombre'],
        conversion = jsonMap['conversion'].toDouble(),
        assert(nombre != null),
        assert(conversion != null);
}