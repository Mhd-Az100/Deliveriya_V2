class Responsecopon {
  int? id;
  String? name;
  String? avatar;
  String? code;
  int? discountRate;
  int? discountPrice;
  String? from;
  String? to;
  String? description;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Responsecopon(
      {this.id,
      this.name,
      this.avatar,
      this.code,
      this.discountRate,
      this.discountPrice,
      this.from,
      this.to,
      this.description,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Responsecopon.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    code = json['code'];
    discountRate = json['discountRate'];
    discountPrice = json['discountPrice'];
    from = json['from'];
    to = json['to'];
    description = json['description'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['code'] = code;
    data['discountRate'] = discountRate;
    data['discountPrice'] = discountPrice;
    data['from'] = from;
    data['to'] = to;
    data['description'] = description;
    data['isActive'] = isActive;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    return data;
  }
}
