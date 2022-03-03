class ResponseHome {
  ResponseHome({
    this.coupon,
    this.newProduct,
    this.mostOrdered,
    this.productForYou,
  });

  List<Coupon>? coupon;
  List<NewProduct>? newProduct;
  List<MostOrdered>? mostOrdered;
  List<NewProduct>? productForYou;

  factory ResponseHome.fromJson(Map<String, dynamic> json) => ResponseHome(
        coupon:
            List<Coupon>.from(json["coupon"].map((x) => Coupon.fromJson(x))),
        newProduct: List<NewProduct>.from(
            json["newProduct"].map((x) => NewProduct.fromJson(x))),
        mostOrdered: List<MostOrdered>.from(
            json["mostOrdered"].map((x) => MostOrdered.fromJson(x))),
        productForYou: List<NewProduct>.from(
            json["productForYou"].map((x) => NewProduct.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "coupon": List<dynamic>.from(coupon!.map((x) => x.toJson())),
        "newProduct": List<dynamic>.from(newProduct!.map((x) => x.toJson())),
        "mostOrdered": List<dynamic>.from(mostOrdered!.map((x) => x.toJson())),
        "productForYou":
            List<dynamic>.from(productForYou!.map((x) => x.toJson())),
      };
}

class Coupon {
  Coupon({
    this.id,
    this.name,
    this.avatar,
    this.code,
    this.discountRate,
    this.discountPrice,
    this.from,
    this.to,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.userCoupons,
  });

  int? id;
  String? name;
  String? avatar;
  String? code;
  int? discountRate;
  int? discountPrice;
  DateTime? from;
  DateTime? to;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? userCoupons;

  factory Coupon.fromJson(Map<String, dynamic> json) => Coupon(
        id: json["id"],
        name: json["name"],
        avatar: json["avatar"],
        code: json["code"],
        discountRate: json["discountRate"],
        discountPrice: json["discountPrice"],
        from: DateTime.parse(json["from"]),
        to: DateTime.parse(json["to"]),
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        userCoupons: List<dynamic>.from(json["UserCoupons"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "avatar": avatar,
        "code": code,
        "discountRate": discountRate,
        "discountPrice": discountPrice,
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "isActive": isActive,
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "UserCoupons": List<dynamic>.from(userCoupons!.map((x) => x)),
      };
}

class MostOrdered {
  MostOrdered({
    this.productId,
    this.totalOrders,
    this.product,
  });

  int? productId;
  int? totalOrders;
  NewProduct? product;

  factory MostOrdered.fromJson(Map<String, dynamic> json) => MostOrdered(
        productId: json["productId"],
        totalOrders: json["totalOrders"],
        product: NewProduct.fromJson(json["Product"]),
      );

  Map<String, dynamic> toJson() => {
        "productId": productId,
        "totalOrders": totalOrders,
        "Product": product!.toJson(),
      };
}

class NewProduct {
  NewProduct({
    this.id,
    this.name,
    this.description,
    this.tax,
    this.view,
    this.orderNumber,
    this.isActive,
    this.createdAt,
    this.updatedAt,
    this.subCategoryId,
    this.measureUnits,
  });

  int? id;
  String? name;
  String? description;
  int? tax;
  int? view;
  int? orderNumber;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? subCategoryId;
  List<MeasureUnit>? measureUnits;

  factory NewProduct.fromJson(Map<String, dynamic> json) => NewProduct(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        tax: json["tax"],
        view: json["view"],
        orderNumber: json["orderNumber"],
        isActive: json["isActive"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        subCategoryId: json["SubCategoryId"],
        measureUnits: json["MeasureUnits"] == null
            ? null
            : List<MeasureUnit>.from(
                json["MeasureUnits"].map((x) => MeasureUnit.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "tax": tax,
        "view": view,
        "orderNumber": orderNumber,
        "isActive": isActive,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "SubCategoryId": subCategoryId,
        "MeasureUnits": measureUnits == null
            ? null
            : List<dynamic>.from(measureUnits!.map((x) => x.toJson())),
      };
}

class MeasureUnit {
  MeasureUnit({
    this.id,
    this.price,
    this.min,
    this.max,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.productId,
  });

  int? id;
  int? price;
  int? min;
  int? max;
  String? name;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? productId;

  factory MeasureUnit.fromJson(Map<String, dynamic> json) => MeasureUnit(
        id: json["id"],
        price: json["price"],
        min: json["min"],
        max: json["max"],
        name: json["name"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        productId: json["ProductId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "min": min,
        "max": max,
        "name": name,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
        "ProductId": productId,
      };
}
