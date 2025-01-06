import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:convert';

class Functions {
  static final FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  static Future<Map<String, dynamic>?> getUserData() async {
    final userJson = await _secureStorage.read(key: 'user_data');
    return userJson != null ? jsonDecode(userJson) : null;
  }
}
