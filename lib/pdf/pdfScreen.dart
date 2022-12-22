import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pruebawidget/pdf/shipping.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

class PdfScreen extends StatefulWidget {
  const PdfScreen({super.key});

  @override
  State<PdfScreen> createState() => _PdfScreenState();
}

class _PdfScreenState extends State<PdfScreen> {
  String url = 'http://172.20.1.244:3000/';
  List<CrearPdf> _userDetails = [];
  Future<Null> getUserDetails() async {
    final response =
        await http.get(Uri.parse(url + 'api/users/entregasucursal/11'));
    final responseJson = jsonDecode(response.body);

    // CrearEquipo creaequipo =
    //     CrearEquipo.fromJson(GetStorage().read('etiqueta') ?? {});

    //print("asdsda${responseJson}");
    setState(() {
      for (Map<String, dynamic> user in responseJson) {
        _userDetails.add(CrearPdf.fromJson(user));
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: TextButton(
      onPressed: _createPDF,
      child: Text('Create PDF'),
    )));
  }

  Future<void> _createPDF() async {
    final pdf = pw.Document();

    final titles = <String>[
      'Paquete Numero:',
      'Dispositivos:',
    ];
    final titles1 = <String>[
      '${_userDetails[0].nopaquete}',
      '${_userDetails.length}',
    ];
    final headers = [
      'Equipo',
      'Descripcion',
      'Serie',
    ];
    final data = List.generate(_userDetails.length, (index) {
      return [
        _userDetails[index].equipo,
        _userDetails[index].marca,
        _userDetails[index].serie
      ];
    });
    pdf.addPage(pw.MultiPage(
      pageFormat: PdfPageFormat.a4,
      build: (context) => [
        pw.Column(
          children: [
            //Header
            pw.Column(
              children: [
                pw.SizedBox(height: 1 * PdfPageFormat.cm),
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Direccion Central",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(height: 1 * PdfPageFormat.mm),
                        pw.Text("Oficinas Centrales, Guatemala City"),
                      ],
                    ),
                    pw.Container(
                      height: 50,
                      width: 50,
                      child: pw.BarcodeWidget(
                        barcode: pw.Barcode.qrCode(),
                        data: "invoice.info.number",
                      ),
                    ),
                  ],
                ),
                pw.SizedBox(height: 1 * PdfPageFormat.cm),
                pw.Row(
                  crossAxisAlignment: pw.CrossAxisAlignment.end,
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text("Destinatario",
                            style:
                                pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                        pw.Text(_userDetails[0].sucursal),
                      ],
                    ),
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: List.generate(titles.length, (index) {
                        final title = titles[index];
                        final value = titles1[index];

                        return pw.Row(
                          children: [
                            pw.Text(title,
                                style: pw.TextStyle(
                                    fontWeight: pw.FontWeight.bold)),
                            pw.SizedBox(width: 2),
                            pw.Text(value),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ],
            ),
            //<=Header=>
            pw.SizedBox(height: 3 * PdfPageFormat.cm),
            //<=Title
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  'INVOICE',
                  style: pw.TextStyle(
                      fontSize: 24, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 0.8 * PdfPageFormat.cm),
                //descripcion del propducto en casi que se necesite
              ],
            ),
            //title=>
            //<=cuerpo de listado
            pw.Table.fromTextArray(
              headers: headers,
              data: data,
              border: null,
              headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
              headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
              cellHeight: 30,
              cellAlignments: {
                0: pw.Alignment.centerLeft,
                1: pw.Alignment.center,
                2: pw.Alignment.centerRight,
              },
            ),
            //cuerpo=>
          ],
        )
      ],
      footer: (context) => pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.center,
        children: [
          pw.Divider(),
          pw.SizedBox(height: 2 * PdfPageFormat.mm),
          pw.Row(
            mainAxisSize: pw.MainAxisSize.min,
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text("Address",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(width: 2 * PdfPageFormat.mm),
              pw.Text("Oficinas Centrales, Guatemala City"),
            ],
          ),
          pw.SizedBox(height: 1 * PdfPageFormat.mm),
          pw.Row(
            mainAxisSize: pw.MainAxisSize.min,
            crossAxisAlignment: pw.CrossAxisAlignment.end,
            children: [
              pw.Text("PBX",
                  style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(width: 2 * PdfPageFormat.mm),
              pw.Text("1722"),
            ],
          ),
        ],
      ),
    ));

//
    List<int> bytes = await pdf.save();
    //Get external storage directory
    final directory = await getApplicationSupportDirectory();
    //Get directory path
    final path = directory.path;
    //Create an empty file to write PDF data
    File file = File('$path/Output.pdf');
    //Write PDF data
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/Output.pdf');
  }
}
