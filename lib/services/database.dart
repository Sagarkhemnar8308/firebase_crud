import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class ContactMethod {
  Future addEmployeeDetails(
      Map<String, dynamic> employeeInfoMap, String id) async {
    try {
      return await FirebaseFirestore.instance
          .collection("Employee")
          .doc(id)
          .set(employeeInfoMap);
    } catch (e) {
      print("$e");
    }
  }

  Future<Stream<QuerySnapshot>> getEmployeeDetails() async {
    return await FirebaseFirestore.instance.collection("Employee").snapshots();
  }

  Future updateEmployeeDetails(
      String id, Map<String, dynamic> updateInfo) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .update(updateInfo);
  }

  Future deleteEmployeeDetails(String id) async {
    return await FirebaseFirestore.instance
        .collection("Employee")
        .doc(id)
        .delete();
  }

  Future<String> uploadImage(String path, XFile img) async {
    try {
      final ref = FirebaseStorage.instance.ref(path).child(img.name);
      await ref.putFile(File(img.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      print("Getting error to upload the image");
    }
    return "error";
  }
}
