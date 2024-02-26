import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/common/services/storage_services.dart';

class Global {
  static late StorageService storageService;
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    Platform.isAndroid
        ? await Firebase.initializeApp(
            options: FirebaseOptions(
                apiKey: "AIzaSyA9lsWxG9EO2IpFDIHORgxpE4lM-COb82Y",
                appId: "1:23079761245:android:d2ff2d7e0f87ac6f37a4b4",
                messagingSenderId: "23079761245",
                projectId: "ulearn-38e7d"))
        : await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
