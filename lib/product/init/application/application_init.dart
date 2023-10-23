import 'package:flutter/material.dart';
import 'package:voco_case_study/product/database/locale_database.dart';

class ApplicationInit {
  static Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SharedCacheManager.preferencesInit();
  }
}
