import 'package:cloud_firestore/cloud_firestore.dart';

class FireStoreService {
  static FirebaseFirestore firebaseFirestoreInstance =
      FirebaseFirestore.instance;
  static CollectionReference<Map<String, dynamic>> users() {
    return firebaseFirestoreInstance.collection("users");
  }

  static CollectionReference<Map<String, dynamic>> customers() {
    return users().doc("currentUserid").collection("customers");
  }
}
