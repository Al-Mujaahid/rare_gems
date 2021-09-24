import 'package:rare_gem/src/models/entities/InvestmentPackage.dart';

class Investment {
  int? id;
  InvestmentPackage? package;
  int? slots;
  double? amount;
  String? investmentDate;
  String? returnDate;
  String? rollover;
  String? status;

  Investment(
      {this.id,
        this.package,
        this.slots,
        this.amount,
        this.investmentDate,
        this.returnDate,
        this.rollover,
        this.status});

  Investment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package =
    json['package'] != null ? new InvestmentPackage.fromJson(json['package']) : null;
    slots = int.tryParse(json['slots']);
    amount = double.parse(json['amount']);
    investmentDate = json['investment_date'];
    returnDate = json['return_date'];
    rollover = json['rollover'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.package != null) {
      data['package'] = this.package!.toJson();
    }
    data['slots'] = this.slots;
    data['amount'] = this.amount;
    data['investment_date'] = this.investmentDate;
    data['return_date'] = this.returnDate;
    data['rollover'] = this.rollover;
    data['status'] = this.status;
    return data;
  }
}