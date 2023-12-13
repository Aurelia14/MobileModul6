// File: appwrite_client.dart
import 'package:appwrite/appwrite.dart';

class AppwriteClientService {
  Client client = Client();

  AppwriteClientService() {
    client
        .setEndpoint('https://cloud.appwrite.io/v1')
        .setProject('65669efb2cc68992b1ba')
        .setSelfSigned(status: true); // Hanya untuk pengembangan
  }
}
