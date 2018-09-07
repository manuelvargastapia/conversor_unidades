import 'package:flutter/material.dart';

final _alturaRow = 100.0;
final _borderRadius = BorderRadius.circular(_alturaRow/2);

class Category extends StatelessWidget{

  final String nombre;
  final Color color;
  final IconData icono;

  const Category({
    Key key,
    @required this.nombre,
    @required this.icono,
    @required this.color,
})  : assert (nombre != null),
      assert (icono != null),
      assert (color != null),
      super (key: key);

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
          onTap: (){
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