class Rate {
  double buy = 0.0;
  double sell = 0.0;

  Rate({this.buy = 0.0, this.sell = 0.0});

  Rate.fromJson(Map<String, dynamic> json) {
    buy = json['buy'];
    sell = json['sell'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['buy'] = this.buy;
    data['sell'] = this.sell;
    return data;
  }
}
