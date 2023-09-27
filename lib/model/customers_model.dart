import 'dart:convert';

class CustomerModel {
  final String documentID;
  final String name;
  final String address;
  final int bandiRate;
  final int bandiMilk;
  final int kiraya;
  final int commision;
  final String contact;
  CustomerModel({
    required this.kiraya,
    required this.commision,
    required this.bandiMilk,
    required this.documentID,
    required this.name,
    required this.address,
    required this.bandiRate,
    required this.contact,
  });
  factory CustomerModel.fromMap(
      {required Map<String, dynamic> map, required String documentID}) {
    return CustomerModel(
      documentID: documentID,
      address: map["address"],
      name: map["name"],
      bandiRate: map["bandiRate"],
      contact: map["contact"],
      bandiMilk: map["bandiMilk"],
      commision: map["commision"] ?? 0,
      kiraya: map["kiraya"] ?? 0,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'address': address,
      'balance': bandiRate,
      'contact': contact,
      'bandiMilk': bandiMilk,
      'commision': commision,
      'kiraya': kiraya,
    };
  }

  CustomerModel copyWith(
      {String? name,
      String? address,
      int? bandiRate,
      String? contact,
      int? bandiMilk,
      int? commision,
      int? kiraya}) {
    return CustomerModel(
      documentID: documentID,
      name: name ?? this.name,
      address: address ?? this.address,
      bandiRate: bandiRate ?? this.bandiRate,
      contact: contact ?? this.contact,
      bandiMilk: bandiMilk ?? this.bandiMilk,
      commision: commision ?? this.commision,
      kiraya: kiraya ?? this.kiraya,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(
          {required String source, required String documentID}) =>
      CustomerModel.fromMap(map: json.decode(source), documentID: documentID);

  // @override
  // String toString() {
  //   return 'CustomerModel(userID: $documentID, name: $name, address: $address, balance: $balance, contact: $contact)';
  // }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.documentID == documentID &&
        other.name == name &&
        other.address == address &&
        other.bandiRate == bandiRate &&
        other.contact == contact;
  }

  @override
  int get hashCode {
    return documentID.hashCode ^
        name.hashCode ^
        address.hashCode ^
        bandiRate.hashCode ^
        contact.hashCode;
  }
}
