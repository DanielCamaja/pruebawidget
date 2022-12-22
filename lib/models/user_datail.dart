import 'dart:convert';

class UserDetails {
  UserDetails({
    required this.id,
    required this.equipo,
    required this.marca,
    required this.modelo,
    required this.serie,
    required this.imei,
  });

  String id;
  String equipo;
  String marca;
  String modelo;
  String serie;
  String imei;

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
        id: json["id"],
        equipo: json["equipo"],
        marca: json["marca"],
        modelo: json["modelo"],
        serie: json["serie"],
        imei: json["imei"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "equipo": equipo,
        "marca": marca,
        "modelo": modelo,
        "serie": serie,
        "imei": imei,
      };
}
