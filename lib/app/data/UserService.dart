import 'package:appwrite/appwrite.dart';
import '../../appwrite_client.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;
import 'dart:io';

class UserService {
  late final Databases _databases;
  late final Storage _storage;
  final String _databaseId = '656dbeb3a36a48864503'; // ID Database
  final String _collectionId = '656dbedad3e05c0a9d8a'; // ID Koleksi
  final String _bucketId = '656dbf914cdbf6e95ffe';
  final Uuid _uuid = Uuid();
  late final Client client;

  UserService() {
    client = Get.find<AppwriteClientService>().client;
    _databases = Databases(client);
    _storage = Storage(client);
  }

  // Get User
  Future<Map<String, dynamic>> getUser(String documentId) async {
    var response = await _databases.getDocument(
      databaseId: _databaseId,
      collectionId: _collectionId,
      documentId: documentId,
    );
    return response.data;
  }

  // Get User by Email and Password
  Future<Map<String, dynamic>?> getUserByEmailAndPassword(
      String email, String password) async {
    try {
      var response = await _databases.listDocuments(
        databaseId: _databaseId,
        collectionId: _collectionId,
        queries: [
          Query.equal('email', email),
          Query.equal('password', password), // Ini bukan praktik terbaik
        ],
      );

      if (response.documents.isEmpty) {
        return null; // Tidak ada pengguna yang ditemukan dengan kombinasi email dan password tersebut
      }

      // Mengembalikan data pengguna pertama yang ditemukan
      return response.documents.first.data;
    } on AppwriteException catch (e) {
      print('Error saat mendapatkan data pengguna: ${e.message}');
      return null;
    }
  }

  // Create User
  Future<Map<String, dynamic>> createUser({
    required String name,
    required String username,
    required String email,
    required String password,
  }) async {
    String userid = _uuid.v4();

    var userData = {
      'user_id': userid,
      'name': name,
      'username': username,
      'email': email,
      'password': password, // Idealnya, hash password sebelum menyimpan
    };

    var response = await _databases.createDocument(
      databaseId: _databaseId,
      collectionId: _collectionId,
      documentId: 'unique()',
      data: userData,
    );

    return response.data;
  }

  // Update User
  Future<Map<String, dynamic>> updateUser({
    required String documentId,
    required Map<String, dynamic> data,
    File? imageFile, // Opsional: File image untuk di-upload
  }) async {
    if (imageFile != null) {
      var fileId = await uploadImageToStorage(imageFile);
      data['images'] = fileId; // Menambahkan ID file ke data user
    }

    var response = await _databases.updateDocument(
      databaseId: _databaseId,
      collectionId: _collectionId,
      documentId: documentId,
      data: data,
    );
    return response.data;
  }

  // Fungsi untuk upload image ke storage
  Future<String> uploadImageToStorage(File imageFile) async {
    var fileName = path.basename(imageFile.path);
    var result = await _storage.createFile(
      bucketId: _bucketId,
      fileId: 'unique()',
      file: InputFile(path: imageFile.path, filename: fileName),
    );

    return result.$id;
  }

  // Delete User
  Future<void> deleteUser(String documentId) async {
    await _databases.deleteDocument(
      databaseId: _databaseId,
      collectionId: _collectionId,
      documentId: documentId,
    );
  }

  Future<String> getPublicImageUrl(String fileId) async {
    try {
      // Menggunakan endpoint untuk mendapatkan view file
      await _storage.getFileView(
        bucketId: _bucketId,
        fileId: fileId,
      );

      String url =
          '${client.endPoint}/storage/buckets/$_bucketId/files/$fileId/view?project=65669efb2cc68992b1ba&mode=admin';

      return url;
    } catch (e) {
      print('Error saat mendapatkan URL gambar: $e');
      return ''; // Mengembalikan string kosong jika terjadi kesalahan
    }
  }
}
