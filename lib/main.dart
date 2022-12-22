import 'package:flutter/material.dart';
import 'package:pruebawidget/Tablelist/TableScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(_title),
          backgroundColor: Colors.grey,
        ),
        body: TableScreen(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Table(
          border: TableBorder
              .all(), // Allows to add a border decoration around your table
          children: [
            TableRow(children: [
              Text('Cantidad'),
              Text('Codigo'),
              Text('Nombre'),
              Text('%Desc'),
              Text('precio Pub.'),
              Text('%Oferta'),
              Text('Precio Neto'),
              Text('Subtotal'),
              Text('Accion'),
            ]),
            TableRow(children: [
              Text("2"),
              Text("ej4l12k"),
              Text("VENTA DE PRODUCTO CAJA X 30"),
              Text("0"),
              Text("000.01"),
              Text("0"),
              Text("000.01"),
              Text(
                "000.01",
                style: TextStyle(
                  color: Color.fromRGBO(17, 116, 197, 1),
                ),
              ),
              Text("X"),
            ]),
          ],
        ),
      ),
    );
  }
}
