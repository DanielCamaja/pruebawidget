import 'package:flutter/material.dart';

class TableScreen extends StatelessWidget {
  // this dummy data will be displayed in the table
  final List<Map> _users = [
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
    {'id': 1, 'name': 'John'},
    {'id': 2, 'name': 'John'},
    {'id': 3, 'name': 'John'},
  ];

  TableScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(25),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Table(
              // border: TableBorder
              //     .all(), // Allows to add a border decoration around your table
              children: const [
                TableRow(children: [
                  Center(
                      child: Text('Cantidad', style: TextStyle(fontSize: 20))),
                  Text('Codigo'),
                  Text('Nombre'),
                  Text('%Desc'),
                  Text('precio Pub.'),
                  Text('%Oferta'),
                  Text('Precio Neto'),
                  Text('Subtotal'),
                  Text('Accion'),
                ]),
              ],
            ),
            Table(
              children: _users.map((user) {
                return TableRow(children: [
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['id'].toString())),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['name'])),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['id'].toString())),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['name'])),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['id'].toString())),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['name'])),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['id'].toString())),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['name'])),
                  Container(
                      color: _users.indexOf(user) % 2 == 0
                          ? Colors.blue[50]
                          : Colors.amber[50],
                      padding: const EdgeInsets.all(15),
                      child: Text(user['id'].toString())),
                ]);
              }).toList(),
              border: TableBorder.all(width: 1, color: Colors.black),
            ),
          ],
        ),
      ),
    ));
  }
}
