// To parse this JSON data, do
//
//     final listadoModel = listadoModelFromJson(jsonString);

import 'dart:convert';

ListadoModel listadoModelFromJson(String str) =>
    ListadoModel.fromJson(json.decode(str));

String listadoModelToJson(ListadoModel data) => json.encode(data.toJson());

class ListadoModel {
  ListadoModel({
    required this.imagen,
    required this.codigo,
    required this.nombre,
    required this.precioneto,
    required this.preciooferta,
    required this.existencia,
    required this.bono,
    required this.exitenciatienda,
    required this.espadre,
    required this.laboratorio,
    required this.promo,
    required this.principioactivo,
    required this.codbarras,
    required this.aproximacion,
    required this.recetado,
    required this.sustituto,
  });

  String imagen;
  String codigo;
  String nombre;
  String precioneto;
  String preciooferta;
  String existencia;
  String bono;
  String exitenciatienda;
  String espadre;
  String laboratorio;
  String promo;
  String principioactivo;
  String codbarras;
  String aproximacion;
  String recetado;
  String sustituto;

  factory ListadoModel.fromJson(Map<String, dynamic> json) => ListadoModel(
        imagen: json["imagen"],
        codigo: json["codigo"],
        nombre: json["nombre"],
        precioneto: json["precioneto"],
        preciooferta: json["preciooferta"],
        existencia: json["existencia"],
        bono: json["bono"],
        exitenciatienda: json["exitenciatienda"],
        espadre: json["espadre"],
        laboratorio: json["laboratorio"],
        promo: json["promo"],
        principioactivo: json["principioactivo"],
        codbarras: json["codbarras"],
        aproximacion: json["aproximacion"],
        recetado: json["recetado"],
        sustituto: json["sustituto"],
      );

  Map<String, dynamic> toJson() => {
        "imagen": imagen,
        "codigo": codigo,
        "nombre": nombre,
        "precioneto": precioneto,
        "preciooferta": preciooferta,
        "existencia": existencia,
        "bono": bono,
        "exitenciatienda": exitenciatienda,
        "espadre": espadre,
        "laboratorio": laboratorio,
        "promo": promo,
        "principioactivo": principioactivo,
        "codbarras": codbarras,
        "aproximacion": aproximacion,
        "recetado": recetado,
        "sustituto": sustituto,
      };
}
