import 'dart:convert';

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(
    json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientModelToJson(List<ClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  ClientModel({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.address,
    this.photo,
    this.caption,
    this.createdAt,
    this.updatedAt,
    this.deleted,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? address;
  String? photo;
  String? caption;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? deleted;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        address: json["address"],
        photo: json["photo"],
        caption: json["caption"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        deleted: json["deleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "address": address,
        "photo": photo,
        "caption": caption,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "deleted": deleted,
      };
}
