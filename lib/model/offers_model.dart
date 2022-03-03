class Responseoffers {
  int? id;
  int? price;
  int? beforePrice;
  String? type;
  String? avatar;
  String? mediaType;
  String? color;
  int? quantity;
  int? min;
  int? max;
  int? category;
  int? subCategory;
  int? discountRate;
  var discountPrice;
  String? form;
  String? to;
  String? name;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? mager;
  var productId;
  List? userOffers = [];
  List? favorites = [];

  Responseoffers(
      {this.id,
      this.price,
      this.mager,
      this.beforePrice,
      this.type,
      this.avatar,
      this.mediaType,
      this.color,
      this.quantity,
      this.min,
      this.max,
      this.category,
      this.subCategory,
      this.discountRate,
      this.discountPrice,
      this.form,
      this.to,
      this.name,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.productId,
      this.userOffers,
      this.favorites});

  Responseoffers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['afterPrice'];
    beforePrice = json['beforePrice'];
    type = json['type'];
    avatar = json['media'];
    mediaType = json['mediaType'];
    color = json['color'];
    quantity = json['quantity'];
    min = json['min'];
    max = json['max'];
    mager = 'Piece';
    category = json['category'];
    subCategory = json['subCategory'];
    discountRate = json['discountRate'];
    discountPrice = json['discountPrice'];
    form = json['form'];
    to = json['to'];
    name = json['name'];
    description = json['description'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    productId = json['ProductId'];
    if (json['UserOffers'] != null) {
      userOffers = json['UserOffers'];
    }
    if (json['Favorites'] != null) {
      favorites = json['Favorites'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['afterPrice'] = this.price;
    data['beforePrice'] = this.beforePrice;
    data['type'] = this.type;
    data['media'] = this.avatar;
    data['mediaType'] = this.mediaType;
    data['color'] = this.color;
    data['quantity'] = this.quantity;
    data['min'] = this.min;
    data['max'] = this.max;
    data['category'] = this.category;
    data['subCategory'] = this.subCategory;
    data['discountRate'] = this.discountRate;
    data['discountPrice'] = this.discountPrice;
    data['form'] = this.form;
    data['to'] = this.to;
    data['name'] = this.name;
    data['description'] = this.description;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['ProductId'] = this.productId;
    if (this.userOffers != null) {
      data['UserOffers'] = this.userOffers!.map((v) => v.toJson()).toList();
    }
    if (this.favorites != null) {
      data['Favorites'] = this.favorites!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
