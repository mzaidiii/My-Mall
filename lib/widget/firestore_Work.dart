import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:practice/model/singnUp.dart';

final _db = FirebaseFirestore.instance;

class FirestoreWork {
  Future<void> createUser(Singnup signup) async {
    try {
      await _db.collection('user_data').add(signup.toJson());
      print("✅ User added successfully!");
    } catch (e) {
      print("❌ Error adding user: $e");
    }
  }
}
