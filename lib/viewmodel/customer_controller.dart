import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_mvvm/repositories/customers_repository.dart';
import 'package:firebase_mvvm/services/network_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/customers_model.dart';

// final customerProvider =
//     StateNotifierProvider<CustomerController, List<CustomerModel>?>((ref) {
//   final currentUserid = ref.read(currentUserProvider)!.uid;
//   final controller = CustomerController();
//   controller.fetchData(
//       currentUserid); // Call the fetchData method to populate the initial state
//   return controller;
// });

class CustomerController extends StateNotifier<List<CustomerModel>?> {
  CustomerController() : super(null);
  CustomersRepository repo = CustomersRepository();
  resetState() {
    state = null;
  }

  void fetchData(String currentUserid) async {
    final snapshot = await repo.get();
    final customers = snapshot.docs.map((doc) {
      final dataMap = doc.data();
      return CustomerModel.fromMap(map: dataMap, documentID: doc.id.trim());
    }).toList();

    state = customers;
  }

  Future<void> uploadData(String currentUserid,
      {required String name,
      String? address,
      int? bandiRate,
      String? contact,
      int? bandiMilk,
      int? kiraya,
      int? commision}) async {
    final newDocID = " UID.setDocumentId(DateTime.now())";
    final newCustomer = CustomerModel(
      address: address.toString(),
      contact: contact.toString(),
      name: name,
      bandiRate: bandiRate ?? 0,
      documentID: newDocID,
      bandiMilk: bandiMilk ?? 0,
      commision: commision ?? 0,
      kiraya: kiraya ?? 0,
    );
    try {
      FirebaseFirestore.instance
          .collection("users")
          .doc(currentUserid)
          .collection("customers")
          .doc(newDocID)
          .set({
        "address": address.toString(),
        "contact": contact.toString(),
        "name": name,
        "bandiRate": bandiRate ?? 0,
        "bandiMilk": bandiMilk ?? 0,
        "kiraya": kiraya ?? 0,
        "commision": commision ?? 0
      });

      state = [...state!, newCustomer];
    } catch (error) {
      if (error is FirebaseException) {
        if (error.code == "unavailable") {
          // Utils.toastMessage("No Internet \n working offline");
        }
      } else {
        // Handle other non-Firebase related errors
      }
    }
  }
}
