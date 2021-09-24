class ApiResponse {
  bool? status;
  String? message;
  dynamic data;

  ApiResponse.fromJSON(json) {
    status = json['status'];
    message = json['message'];
    data = json['data'];
  }

  Map toJSON() {
    Map json = {};
    json['status'] = status;
    json['message'] = message;
    json['data'] = data;
    return json;
  }
}
