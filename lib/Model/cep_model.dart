import 'dart:convert';

class CepModel {
  String? cep;
  String? logradouro;
  String? complemento;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  CepModel({
    this.cep,
    this.logradouro,
    this.complemento,
    this.bairro,
    this.localidade,
    this.uf,
    this.ibge,
    this.gia,
    this.ddd,
    this.siafi,
  });

  Map<String, dynamic> toMap() {
    return {
      'cep': cep,
      'logradouro': logradouro,
      'complemento': complemento,
      'bairro': bairro,
      'localidade': localidade,
      'uf': uf,
      'ibge': ibge,
      'gia': gia,
      'ddd': ddd,
      'siafi': siafi,
    };
  }

  factory CepModel.fromMap(Map<String, dynamic> map) {
    return CepModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      complemento: map['complemento'],
      bairro: map['bairro'],
      localidade: map['localidade'],
      uf: map['uf'],
      ibge: map['ibge'],
      gia: map['gia'],
      ddd: map['ddd'],
      siafi: map['siafi'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CepModel.fromJson(String source) =>
      CepModel.fromMap(json.decode(source));

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CepModel &&
        other.cep == cep &&
        other.logradouro == logradouro &&
        other.complemento == complemento &&
        other.bairro == bairro &&
        other.localidade == localidade &&
        other.uf == uf &&
        other.ibge == ibge &&
        other.gia == gia &&
        other.ddd == ddd &&
        other.siafi == siafi;
  }

  @override
  int get hashCode {
    return cep.hashCode ^
        logradouro.hashCode ^
        complemento.hashCode ^
        bairro.hashCode ^
        localidade.hashCode ^
        uf.hashCode ^
        ibge.hashCode ^
        gia.hashCode ^
        ddd.hashCode ^
        siafi.hashCode;
  }

  @override
  String toString() {
    return 'CepModel(cep: $cep, logradouro: $logradouro, complemento: $complemento, bairro: $bairro, localidade: $localidade, uf: $uf, ibge: $ibge, gia: $gia, ddd: $ddd, siafi: $siafi)';
  }
}
