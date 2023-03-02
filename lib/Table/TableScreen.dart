import 'package:flutter/material.dart';
import 'package:pruebawidget/HorizontalScroll.dart';
import 'package:pruebawidget/models/ListadoModel.dart';

class TableScreen extends StatefulWidget {
  @override
  _TableScreenState createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  List<ListadoModel> users = [
    ListadoModel(
      imagen: "imagen",
      codigo: "codigo",
      nombre: "nombre",
      precioneto: "precioneto",
      preciooferta: "preciooferta",
      existencia: "existencia",
      bono: "bono",
      exitenciatienda: "exitenciatienda",
      espadre: "espadre",
      laboratorio: "laboratorio",
      promo: "promo",
      principioactivo: "principioactivo",
      codbarras: "codbarras",
      aproximacion: "aproximacion",
      recetado: "recetado",
      sustituto: "sustituto",
    ),
  ];
  TextEditingController controller1 = TextEditingController();
  String _searchResult = '';
  List<ListadoModel> usersFiltered = [];
  @override
  void initState() {
    super.initState();
    usersFiltered = users;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: MyCustomScrollBehavior(),
      home: Scaffold(
          body: Column(
        children: [
          Card(
            color: Colors.amber,
            child: ListTile(
              leading: Icon(Icons.search),
              title: TextField(
                  controller: controller1,
                  decoration: InputDecoration(
                      hintText: 'Search', border: InputBorder.none),
                  onChanged: (value) {
                    setState(() {
                      _searchResult = value;
                      usersFiltered = users
                          .where((user) =>
                              user.codigo.contains(_searchResult) ||
                              user.nombre.contains(_searchResult))
                          .toList();
                    });
                  }),
              trailing: IconButton(
                icon: Icon(Icons.cancel),
                onPressed: () {
                  setState(() {
                    controller1.clear();
                    _searchResult = '';
                    usersFiltered = users;
                  });
                },
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: DataTable(
              columns: const <DataColumn>[
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Book')),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Book')),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Book')),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Book')),
                DataColumn(label: Text('Author')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Book')),
                DataColumn(label: Text('este es 15')),
                DataColumn(label: Text('este es el 16')),
              ],
              rows: List.generate(
                usersFiltered.length,
                (index) => DataRow(
                  cells: <DataCell>[
                    DataCell(Text(usersFiltered[index].codigo)),
                    DataCell(Text(usersFiltered[index].precioneto)),
                    DataCell(Text(usersFiltered[index].nombre)),
                    DataCell(Text(usersFiltered[index].codigo)),
                    DataCell(Text(usersFiltered[index].precioneto)),
                    DataCell(Text(usersFiltered[index].nombre)),
                    DataCell(Text(usersFiltered[index].codigo)),
                    DataCell(Text(usersFiltered[index].precioneto)),
                    DataCell(Text(usersFiltered[index].nombre)),
                    DataCell(Text(usersFiltered[index].codigo)),
                    DataCell(Text(usersFiltered[index].precioneto)),
                    DataCell(Text(usersFiltered[index].nombre)),
                    DataCell(Text(usersFiltered[index].nombre)),
                    DataCell(Text(usersFiltered[index].codigo)),
                    DataCell(Text(usersFiltered[index].precioneto)),
                    DataCell(Text(usersFiltered[index].nombre)),
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          // ListView(
          //   children: [_createDataTable()],
          // ),
          ),
    );
  }
}
