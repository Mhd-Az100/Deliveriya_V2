// ignore_for_file: prefer_null_aware_operators

class Responseproduct {
  int? id;
  String? name;
  String? description;
  int? tax;
  int? view;
  int? orderNumber;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? subCategoryId;
  List<MeasureUnits>? measureUnits;
  List<OfferItems>? offerItems;
  List? carts;
  List? favorites;
  List<Attachments>? attachments;

  Responseproduct(
      // offerItems.length
      {this.id,
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
      this.offerItems,
      this.carts,
      this.favorites,
      this.attachments});

  Responseproduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    tax = json['tax'];
    view = json['view'];
    orderNumber = json['orderNumber'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    subCategoryId = json['SubCategoryId'];

    if (json['MeasureUnits'] != null) {
      measureUnits = <MeasureUnits>[];
      json['MeasureUnits'].forEach((v) {
        measureUnits!.add(new MeasureUnits.fromJson(v));
      });
    }
    if (json['OfferItems'] != null) {
      offerItems = <OfferItems>[];
      json['OfferItems'].forEach((v) {
        offerItems!.add(new OfferItems.fromJson(v));
      });
    }

    carts = json['Carts'];

    favorites = json['Favorites'];
    if (json['Attachments'] != null) {
      attachments = <Attachments>[];
      json['Attachments'].forEach((v) {
        attachments!.add(new Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['tax'] = this.tax;
    data['view'] = this.view;
    data['orderNumber'] = this.orderNumber;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['SubCategoryId'] = this.subCategoryId;

    if (this.measureUnits != null) {
      data['MeasureUnits'] = this.measureUnits!.map((v) => v.toJson()).toList();
    }
    if (this.offerItems != null) {
      data['OfferItems'] = this.offerItems!.map((v) => v.toJson()).toList();
    }
    if (this.carts != null) {
      data['Carts'] = this.carts!.map((v) => v.toJson()).toList();
    }
    if (this.favorites != null) {
      data['Favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    if (this.attachments != null) {
      data['Attachments'] = this.attachments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OrderItems {
  int? id;

  OrderItems({this.id});

  OrderItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class MeasureUnits {
  int? id;
  int? price;
  int? min;
  int? max;
  String? name;
  String? createdAt;
  String? updatedAt;
  int? productId;
  Null? unitOfMeasurementId;

  MeasureUnits(
      {this.id,
      this.price,
      this.min,
      this.max,
      this.name,
      this.createdAt,
      this.updatedAt,
      this.productId,
      this.unitOfMeasurementId});

  MeasureUnits.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    min = json['min'];
    max = json['max'];
    name = json['name'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['ProductId'];
    unitOfMeasurementId = json['UnitOfMeasurementId'];
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
    data['UnitOfMeasurementId'] = this.unitOfMeasurementId;
    return data;
  }
}

class OfferItems {
  int? id;
  int? quantity;
  String? createdAt;
  String? updatedAt;
  int? offerId;
  int? productId;
  Offer? offer;

  OfferItems(
      {this.id,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.offerId,
      this.productId,
      this.offer});

  OfferItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    offerId = json['OfferId'];
    productId = json['ProductId'];
    offer = json['Offer'] != null ? new Offer.fromJson(json['Offer']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['quantity'] = this.quantity;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['OfferId'] = this.offerId;
    data['ProductId'] = this.productId;
    if (this.offer != null) {
      data['Offer'] = this.offer!.toJson();
    }
    return data;
  }
}

class Offer {
  int? id;
  int? discountRate;

  Offer({this.id, this.discountRate});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discountRate = json['discountRate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['discountRate'] = this.discountRate;
    return data;
  }
}

class Attachments {
  int? id;
  String? url;
  String? createdAt;
  String? updatedAt;
  int? productId;

  Attachments(
      {this.id, this.url, this.createdAt, this.updatedAt, this.productId});

  Attachments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['ProductId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ProductId'] = this.productId;
    return data;
  }
}
