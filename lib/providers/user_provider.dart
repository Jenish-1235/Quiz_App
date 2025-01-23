// lib/providers/user_provider.dart
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../services/storage_service.dart';

class UserProvider with ChangeNotifier {
  User? _user;
  final StorageService _storageService = StorageService();

  User? get user => _user;

  Future<void> loadUser() async {
    _user = await _storageService.getUser();
    notifyListeners();
  }

  Future<void> saveUser(User user) async {
    await _storageService.saveUser(user);
    _user = user;
    notifyListeners();
  }
}
