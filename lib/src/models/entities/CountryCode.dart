class CountryCode {
  String name = '';
  String dialCode = '';
  String code = '';

  CountryCode({this.name = '', this.dialCode = '', this.code = ''});

  CountryCode.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    dialCode = json['dial_code'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['dial_code'] = this.dialCode;
    data['code'] = this.code;
    return data;
  }
}
