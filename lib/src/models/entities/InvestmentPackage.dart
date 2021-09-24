class InvestmentPackage {
  int? id;
  String? name;
  double? roi;
  double? pricePerSlot;
  String? description;
  String? image;
  String? investment;

  InvestmentPackage(
      {this.id,
        this.name,
        this.roi,
        this.pricePerSlot,
        this.description,
        this.image,
        this.investment});

  InvestmentPackage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    roi = double.parse(json['roi'].toString());
    pricePerSlot = double.parse(json['price_per_slot'].toString());
    description = json['description'];
    image = json['image'];
    investment = json['investment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['roi'] = this.roi;
    data['price_per_slot'] = this.pricePerSlot;
    data['description'] = this.description;
    data['image'] = this.image;
    data['investment'] = this.investment;
    return data;
  }
}
