import 'package:flutter/material.dart';

import 'package:conversor_unidades/route_categoria.dart';

void main() {
  runApp(ConversorUnidades());
}

/// Este widget es la raíz de la app.
/// La primera pantalla que se ve es una lista de objetos Categoria,
/// desplegada por RouteCategoria, donde cada una de ellas contiene una lista
/// de objetos Unit, a los cuales se accede gracias a RouteConversor.

class ConversorUnidades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Conversor de Unidades',
      home: RouteCategoria(),
    );
  }
}

