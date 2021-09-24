

import 'package:flutter/material.dart';
import 'package:rare_gem/frontend/providers/auth/registration_provider.dart';

class ProfileProvider extends ProfileRegistrationProvider {

  static final _profileProvider = ProfileProvider.createInstance();
  ProfileProvider.createInstance();
  
  factory ProfileProvider() {
    return _profileProvider;
  }

}