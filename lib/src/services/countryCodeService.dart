
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:rare_gem/src/models/entities/CountryCode.dart';

class CountryCodeService {

  static final CountryCodeService _countryCodeService = CountryCodeService.createInstance();
  CountryCodeService.createInstance();

  factory CountryCodeService() {
    return _countryCodeService;
  }


  Future<List<CountryCode>> getAllCountry() async {
    var rawString = await rootBundle.loadString('assets/data/country_and_code.json');
    var data = jsonDecode(rawString);
    List<CountryCode> countryCodes = List.from(data).map((e) => CountryCode.fromJson(e)).toList();

    return countryCodes;
  }

}