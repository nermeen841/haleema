class CountryModel {
  int? statusCode;
  List<Contries>? contries;

  CountryModel({this.statusCode, this.contries});

  CountryModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['contries'] != null) {
      contries = <Contries>[];
      json['contries'].forEach((v) {
        contries!.add(Contries.fromJson(v));
      });
    }
  }
}

class Contries {
  int? id;
  String? code;
  String? nationality;
  String? name;
  String? codeIso;

  Contries({
    this.id,
    this.code,
    this.nationality,
    this.name,
    this.codeIso,
  });

  Contries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    code = json['code'];
    nationality = json['nationality'];
    name = json['name'];
    codeIso = json['code_iso'];
  }
}
