class Responsecart {
  Data? data;

  Responsecart({this.data});

  Responsecart.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Item> item = [];
  int? total;
  int? count;

  Data({required this.item, this.total, this.count});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['item'] != null) {
      item = <Item>[];
      json['item'].forEach((v) {
        item.add(new Item.fromJson(v));
      });
    }
    total = json['total'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.item != null) {
      data['item'] = this.item.map((v) => v.toJson()).toList();
    }
    data['total'] = this.total;
    data['count'] = this.count;
    return data;
  }
}

class Item {
  int? id;
  String? name;
  String? avatar;
  int? price;
  int? afterOffer;
  List<Carts>? carts;
  List<MeasureUnit> measureUnits = [];
  List<OfferItems> offerItems = [];

  Item(
      {this.id,
      this.name,
      this.avatar,
      this.price,
      this.afterOffer,
      this.carts,
      required this.measureUnits,
      required this.offerItems});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    price = json['price'];
    afterOffer = json['afterOffer'];
    if (json['Carts'] != null) {
      carts = <Carts>[];
      json['Carts'].forEach((v) {
        carts!.add(new Carts.fromJson(v));
      });
    }
    if (json['MeasureUnits'] != null) {
      measureUnits = <MeasureUnit>[];
      json['MeasureUnits'].forEach((v) {
        measureUnits.add(new MeasureUnit.fromJson(v));
      });
    }
    if (json['OfferItems'] != null) {
      offerItems = <OfferItems>[];
      json['OfferItems'].forEach((v) {
        offerItems.add(new OfferItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['price'] = this.price;
    data['afterOffer'] = this.afterOffer;
    if (this.carts != null) {
      data['Carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    if (this.measureUnits != null) {
      data['MeasureUnits'] = this.measureUnits.map((v) => v.toJson()).toList();
    }
    if (this.offerItems != null) {
      data['OfferItems'] = this.offerItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Carts {
  int? id;
  int? quantity;
  String? productName;
  String? productPrice;
  String? createdAt;
  String? updatedAt;
  int? measureUnitId;
  int? userId;
  int? productId;
  MeasureUnit? measureUnit;

  Carts(
      {this.id,
      this.quantity,
      this.productName,
      this.productPrice,
      this.createdAt,
      this.updatedAt,
      this.measureUnitId,
      this.userId,
      this.productId,
      this.measureUnit});

  Carts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    productName = json['productName'];
    productPrice = json['productPrice'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    measureUnitId = json['MeasureUnitId'];
    userId = json['UserId'];
    productId = json['ProductId'];
    measureUnit = json['MeasureUnit'] != null
        ? new MeasureUnit.fromJson(json['MeasureUnit'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['productName'] = this.productName;
    data['productPrice'] = this.productPrice;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['MeasureUnitId'] = this.measureUnitId;
    data['UserId'] = this.userId;
    data['ProductId'] = this.productId;
    if (this.measureUnit != null) {
      data['MeasureUnit'] = this.measureUnit!.toJson();
    }
    return data;
  }
}

class MeasureUnit {
  int? id;
  int? price;
  int? min;
  int? max;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? productId;

  MeasureUnit(
      {this.id,
      this.price,
      this.min,
      this.max,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.productId});

  MeasureUnit.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    min = json['min'];
    max = json['max'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['ProductId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['price'] = this.price;
    data['min'] = this.min;
    data['max'] = this.max;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ProductId'] = this.productId;
    return data;
  }
}

class OfferItems {
  int? id;
  Offer? offer;

  OfferItems({this.id, this.offer});

  OfferItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offer = json['Offer'] != null ? new Offer.fromJson(json['Offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.offer != null) {
      data['Offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Offer {
  int? id;

  Offer({this.id});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
