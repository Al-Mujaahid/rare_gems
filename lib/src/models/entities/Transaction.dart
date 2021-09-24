class Transaction {
  int? id;
  String? type;
  String? amount;
  String? method;
  String? description;
  String? status;
  String? date;

  Transaction(
      {this.id,
        this.type,
        this.amount,
        this.method,
        this.description,
        this.status,
        this.date});

  Transaction.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    amount = json['amount'];
    method = json['method'];
    description = json['description'];
    status = json['status'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['amount'] = this.amount;
    data['method'] = this.method;
    data['description'] = this.description;
    data['status'] = this.status;
    data['date'] = this.date;
    return data;
  }
}
