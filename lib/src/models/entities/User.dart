class User {
  int? id;
  String? name;
  String? email;
  String? phoneCode;
  String? phone;
  String? state;
  String? country;
  String? city;
  String? address;
  String? bankName;
  String? accountName;
  String? accountNumber;
  String? nextOfKinName;
  String? nextOfKinPhone;
  String? nextOfKinAddress;
  bool? active;
  bool? emailVerified;
  String? joinedAt;

  User(
      {this.id,
      this.name,
      this.email,
      this.phoneCode,
      this.phone,
      this.state,
      this.country,
      this.city,
      this.address,
      this.bankName,
      this.accountName,
      this.accountNumber,
      this.nextOfKinName,
      this.nextOfKinPhone,
      this.nextOfKinAddress,
      this.active,
      this.emailVerified,
      this.joinedAt});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phoneCode = json['phone_code'];
    phone = json['phone'];
    state = json['state'];
    country = json['country'];
    city = json['city'];
    address = json['address'];
    bankName = json['bank_name'];
    accountName = json['account_name'];
    accountNumber = json['account_number'];
    nextOfKinName = json['next_of_kin_name'];
    nextOfKinPhone = json['next_of_kin_phone'];
    nextOfKinAddress = json['next_of_kin_address'];
    active = json['active'];
    emailVerified = json['email_verified'];
    joinedAt = json['joined_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone_code'] = this.phoneCode;
    data['phone'] = this.phone;
    data['state'] = this.state;
    data['country'] = this.country;
    data['city'] = this.city;
    data['address'] = this.address;
    data['bank_name'] = this.bankName;
    data['account_name'] = this.accountName;
    data['account_number'] = this.accountNumber;
    data['next_of_kin_name'] = this.nextOfKinName;
    data['next_of_kin_phone'] = this.nextOfKinPhone;
    data['next_of_kin_address'] = this.nextOfKinAddress;
    data['active'] = this.active;
    data['email_verified'] = this.emailVerified;
    data['joined_at'] = this.joinedAt;
    return data;
  }
}
