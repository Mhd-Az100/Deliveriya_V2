class ResponseStory {
  int? id;
  String? media;
  String? mediaType;
  String? color;
  String? type;
  String? createdAt;
  String? updatedAt;

  ResponseStory(
      {this.id,
      this.media,
      this.mediaType,
      this.color,
      this.type,
      this.createdAt,
      this.updatedAt});

  ResponseStory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    media = json['media'];
    mediaType = json['mediaType'];
    color = json['color'];
    type = json['type'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['media'] = this.media;
    data['mediaType'] = this.mediaType;
    data['color'] = this.color;
    data['type'] = this.type;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
