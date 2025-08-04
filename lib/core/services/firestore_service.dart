import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruits_hub_dashboard/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Future<void> addData(
      {required String path,
      required Map<String, dynamic> data,
      String? documentId}) async {
    if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData(
      {required String path,
      String? documentId,
      Map<String, dynamic>? query}) async {
    await Future.delayed(Duration(seconds: 1));
    if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data() as Map<String, dynamic>;
    } else {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query != null) {
        if (query['orderBy'] != null) {
          data = data.orderBy(query['orderBy'], descending: query['desc']);
        }
        if (query['limit'] != null) {
          data = data.limit(query['limit'] as int);
        }
      }
      var result = await data.get();
      return result.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Stream<dynamic> streamData(
      {required String path,
      Map<String, dynamic>? query}) async* {
    Query<Map<String, dynamic>> data = firestore.collection(path);
    if (query != null) {
      if (query['orderBy'] != null) {
        data = data.orderBy(query['orderBy'], descending: query['desc']);
      }
      if (query['limit'] != null) {
        data = data.limit(query['limit'] as int);
      }
    }
    await for (var snapshot in data.snapshots()) {
      yield snapshot.docs.map((e) => e.data()).toList();
    }
  }

  @override
  Future<void> updateData(
      {required String path,
      required Map<String, dynamic> data,
      required String documentId}) async {
    await firestore.collection(path).doc(documentId).update(data);
  }
}
