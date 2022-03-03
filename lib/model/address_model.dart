class ResponseAddress {
  ResponseAddress({
    this.id,
    this.street,
    this.locationDescription,
    this.type,
    this.lat,
    this.lng,
    this.name,
    this.phone,
    this.createdAt,
    this.updatedAt,
    this.userId,
    this.townId,
  });

  int? id;
  String? street;
  String? locationDescription;
  String? type;
  double? lat;
  double? lng;
  String? name;
  String? phone;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? userId;
  int? townId;

  factory ResponseAddress.fromJson(Map<String, dynamic> json) =>
      ResponseAddress(
        id: json["id"],
        street: json["street"],
        locationDescription: json["locationDescription"],
        type: json["type"],
        lat: json["lat"].toDouble(),
        lng: json["lng"].toDouble(),
        name: json["name"],
        phone: json["phone"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userId: json["UserId"],
        townId: json["TownId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "street": street,
        "locationDescription": locationDescription,
        "type": type,
        "lat": lat,
        "lng": lng,
        "name": name,
        "phone": phone,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "UserId": userId,
        "TownId": townId,
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
