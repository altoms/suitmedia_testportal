import 'package:flutter/material.dart';
import 'package:suitmedia_testportal/models/user.dart';
import 'package:suitmedia_testportal/services/api_service.dart';

class ThirdScreenProvider with ChangeNotifier {
  List<User> users = [];
  bool isLoading = true;

  ThirdScreenProvider() {
    fetchUsers();
  }

  Future<void> refreshUsers() async {
    await fetchUsers();
  }

  Future<void> fetchUsers() async {
    isLoading = true;
    notifyListeners();

    users = await Apiservice().fetchUsers();
    isLoading = false;
    notifyListeners();
  }
}
