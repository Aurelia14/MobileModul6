// File: main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'app/routes/app_pages.dart';
import 'notification_handler.dart';
import './appwrite_client.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  // Membuat instance dari AppwriteClientService dan mendaftarkannya dengan GetX
  Get.put(AppwriteClientService());

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseMessagingHandler firebaseMessagingHandler =
        FirebaseMessagingHandler();
    firebaseMessagingHandler.initPushNotification(context);

    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
