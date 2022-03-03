class Responsefavorite {
  int? id;
  String? name;
  String? description;
  String? avatar;
  int? price;
  int? tax;
  int? view;
  int? orderNumber;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? subCategoryId;
  List<Favorites> favorites = [];

  Responsefavorite(
      {this.id,
      this.name,
      this.description,
      this.avatar,
      this.price,
      this.tax,
      this.view,
      this.orderNumber,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.subCategoryId,
      required this.favorites});

  Responsefavorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    avatar = json['avatar'];
    price = json['price'];
    tax = json['tax'];
    view = json['view'];
    orderNumber = json['orderNumber'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    subCategoryId = json['SubCategoryId'];
    if (json['Favorites'] != null) {
      favorites = <Favorites>[];
      json['Favorites'].forEach((v) {
        favorites.add(new Favorites.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['avatar'] = this.avatar;
    data['price'] = this.price;
    data['tax'] = this.tax;
    data['view'] = this.view;
    data['orderNumber'] = this.orderNumber;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['SubCategoryId'] = this.subCategoryId;
    if (this.favorites != null) {
      data['Favorites'] = this.favorites.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Favorites {
  int? id;

  Favorites({this.id});

  Favorites.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}
