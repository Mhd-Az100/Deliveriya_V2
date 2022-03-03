class Responseprofile {
  Responseprofile({
    this.id,
    this.firstName,
    this.lastName,
    this.avatar,
    this.gender,
    this.birthDate,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.credentialId,
    this.credential,
  });

  int? id;
  String? firstName;
  String? lastName;
  String? avatar;
  String? gender;
  DateTime? birthDate;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? credentialId;
  Credential? credential;

  factory Responseprofile.fromJson(Map<String, dynamic> json) =>
      Responseprofile(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        avatar: json["avatar"],
        gender: json["gender"],
        birthDate: DateTime.parse(json["birthDate"]),
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        credentialId: json["CredentialId"],
        credential: Credential.fromJson(json["Credential"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "avatar": avatar,
        "gender": gender,
        "birthDate": birthDate?.toIso8601String(),
        "status": status,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "CredentialId": credentialId,
        "Credential": credential?.toJson(),
      };
}

class Credential {
  Credential({
    this.id,
    this.phone,
    this.isActive,
    this.codeExpired,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? phone;
  bool? isActive;
  dynamic? codeExpired;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Credential.fromJson(Map<String, dynamic> json) => Credential(
        id: json["id"],
        phone: json["phone"],
        isActive: json["isActive"],
        codeExpired: json["codeExpired"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "phone": phone,
        "isActive": isActive,
        "codeExpired": codeExpired,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
      };
}

class Status {
  Status({
    this.code,
    this.msg,
  });

  int? code;
  String? msg;

  factory Status.fromJson(Map<String, dynamic> json) => Status(
        code: json["code"],
        msg: json["msg"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
      };
}
