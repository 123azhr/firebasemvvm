import 'package:cloud_firestore/cloud_firestore.dart';

import '../services/firestore_services.dart';

class CustomersRepository {
  Future<dynamic> get() async {
    try {
      Future<QuerySnapshot<Map<String, dynamic>>> getCustomers() async {
        return FireStoreService.users()
            .doc("currentUserid")
            .collection("customers")
            .get();
      }
    } catch (e) {
      rethrow;
    }
  }
}
