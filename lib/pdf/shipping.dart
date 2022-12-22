// To parse this JSON data, do
//
//     final crearPdf = crearPdfFromJson(jsonString);

import 'dart:convert';

CrearPdf crearPdfFromJson(String str) => CrearPdf.fromJson(json.decode(str));

String crearPdfToJson(CrearPdf data) => json.encode(data.toJson());

class CrearPdf {
  CrearPdf({
    required this.nopaquete,
    required this.sucursal,
    required this.equipo,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.imei,
    required this.simcard,
    required this.telefono,
    required this.createdAt,
  });

  String nopaquete;
  String sucursal;
  String equipo;
  String marca;
  String modelo;
  String serie;
  String imei;
  String simcard;
  String telefono;
  DateTime createdAt;

  factory CrearPdf.fromJson(Map<String, dynamic> json) => CrearPdf(
        nopaquete: json["nopaquete"],
        sucursal: json["sucursal"],
        equipo: json["equipo"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        imei: json["imei"],
        simcard: json["simcard"],
        telefono: json["telefono"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "nopaquete": nopaquete,
        "sucursal": sucursal,
        "equipo": equipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "imei": imei,
        "simcard": simcard,
        "telefono": telefono,
        "created_at": createdAt.toIso8601String(),
      };
}
