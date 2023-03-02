import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pruebawidget/models/ListadoModel.dart';

class DataTableScreen extends StatefulWidget {
  const DataTableScreen({super.key});

  @override
  State<DataTableScreen> createState() => _DataTableScreenState();
}

class _DataTableScreenState extends State<DataTableScreen> {
  bool isVisible = true;
  final controllerl = TextEditingController();
  int curreentste = 0;
  //
  List<ListadoModel> users = [
    ListadoModel(
      imagen: "imagen",
      codigo: "P016352",
      nombre:
          "Protector solar facial anthelios xltoque seco fps50+ piel grasa 50ml+anthelios bruma cuer200ml pack",
      precioneto: "300",
      preciooferta: "300",
      existencia: "0",
      bono: "0",
      exitenciatienda: "VER",
      espadre: "PADRE",
      laboratorio: "GENOMMA LAB",
      promo: "-",
      principioactivo: "-",
      codbarras: "7501065606068",
      aproximacion: "70.89",
      recetado: "recetado",
      sustituto: "no",
    ),
  ];
  List<ListadoModel> usersFiltered = [];
  TextEditingController controller1 = TextEditingController();
  String _searchResult = '';

  @override
  void initState() {
    super.initState();
    usersFiltered = users;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DataTable2(
        columns: [
          DataColumn(label: Text('Cant.')),
          DataColumn(label: Text('Codigo')),
          DataColumn(label: Text('Nombre')),
          DataColumn(label: Text('%Desc')),
          DataColumn(label: Text('Precio Pub.')),
          DataColumn(label: Text('%Oferta')),
          DataColumn(label: Text('Precio Neto')),
          DataColumn(label: Text('Subtotal')),
          DataColumn(label: Text('Accion')),
        ],
        rows: List.generate(
          usersFiltered.length,
          (index) => DataRow(
            cells: <DataCell>[
              DataCell(Text("1")),
              DataCell(Text(usersFiltered[index].codigo)),
              DataCell(Text('''${usersFiltered[index].nombre}''')),
              DataCell(Text("0")),
              DataCell(Text(usersFiltered[index].precioneto)),
              DataCell(Text("0")),
              DataCell(Text(usersFiltered[index].precioneto)),
              DataCell(Text(usersFiltered[index].precioneto)),
              DataCell(Text("X")),
            ],
          ),
        ),
      ),
    );
  }
}
