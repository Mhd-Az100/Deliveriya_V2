class DeleteResponse {
  var result;

  DeleteResponse({this.result});

  DeleteResponse.fromJson(Map<String, dynamic> json) {
    result = json['response'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['result'] = this.result;
    return data;
  }
}