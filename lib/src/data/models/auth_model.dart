import 'dart:convert';

AuthModel authModelFromJson(String str) => AuthModel.fromJson(json.decode(str));

String authModelToJson(AuthModel data) => json.encode(data.toJson());

class AuthModel {
  AuthModel({
    this.success,
    this.response,
  });

  bool? success;
  Response? response;

  factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        success: json["success"],
        response: Response.fromJson(json["response"]),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "response": response?.toJson(),
      };
}

class Response {
  Response({
    this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.photo,
    this.phone,
    this.facebookId,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.status,
    this.isNotification,
    this.caption,
    this.tokenType,
    this.accessToken,
  });

  int? id;
  String? firstname;
  String? lastname;
  String? email;
  String? photo;
  String? phone;
  dynamic facebookId;
  int? role;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? status;
  int? isNotification;
  dynamic caption;
  String? tokenType;
  String? accessToken;

  factory Response.fromJson(Map<String, dynamic> json) => Response(
        id: json["id"],
        firstname: json["firstname"],
        lastname: json["lastname"],
        email: json["email"],
        photo: json["photo"],
        phone: json["phone"],
        facebookId: json["facebook_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        status: json["status"],
        isNotification: json["is_notification"],
        caption: json["caption"],
        tokenType: json["token_type"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "photo": photo,
        "phone": phone,
        "facebook_id": facebookId,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "status": status,
        "is_notification": isNotification,
        "caption": caption,
        "token_type": tokenType,
        "access_token": accessToken,
      };
}
