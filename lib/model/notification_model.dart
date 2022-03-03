class ResponseNotification {
  int? id;
  String? type;
  int? itemId;
  String? description;
  String? title;
  String? avatar;
  var readAt;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  int? credentialId;

  ResponseNotification(
      {this.id,
      this.type,
      this.itemId,
      this.description,
      this.title,
      this.avatar,
      this.readAt,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.credentialId});

  ResponseNotification.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    itemId = json['itemId'];
    description = json['description'];
    title = json['title'];
    avatar = json['avatar'];
    readAt = json['readAt'];
    isActive = json['isActive'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    credentialId = json['CredentialId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['itemId'] = this.itemId;
    data['description'] = this.description;
    data['title'] = this.title;
    data['avatar'] = this.avatar;
    data['readAt'] = this.readAt;
    data['isActive'] = this.isActive;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['CredentialId'] = this.credentialId;
    return data;
  }
}
