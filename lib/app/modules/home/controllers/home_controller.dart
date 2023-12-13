import 'package:flutter/material.dart'; // tambahkan ini
import 'package:get/get.dart';
import '../../news/views/news_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var selectedIndex = 0.obs;
  List symptoms = ["Temperature", "Snuffle", "Fever", "Cough", "Cold"];
  List imgs = ["doctor1.jpg", "doctor2.jpg", "doctor3.jpg", "doctor4.jpg"];

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> logout() async {
    await _auth.signOut();
    await _clearCredentials();
    Get.offAllNamed('/login'); // Navigate to login
  }

  Future<void> _clearCredentials() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  // Tambahkan lebih banyak layar di sini
  final screens = [
    Container(),
    Container(
      child: Center(
        child: Text('Messages Screen'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Schedule Screen'),
      ),
    ),
    NewsView(),
    Container(
      child: Center(
        child: Text('Settings Screen'),
      ),
    ),
  ].obs;

  @override
  void onInit() {
    super.onInit();
  }

  void updateIndex(int index) {
    selectedIndex.value = index;
  }
}
