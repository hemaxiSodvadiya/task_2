import 'package:cloud_firestore/cloud_firestore.dart';

class TravelHelper {
  TravelHelper._();

  static final TravelHelper travelHelper = TravelHelper._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference studentsRef;
  late CollectionReference counterRef;

  void connectWithStudentsCollection() {
    studentsRef = firebaseFirestore.collection("travel");
  }

  void connectionWithCounterCollection() {
    counterRef = firebaseFirestore.collection("counters");
  }

  Future<void> insertRecord({required Map<String, dynamic> data}) async {
    connectWithStudentsCollection();
    connectionWithCounterCollection();

    DocumentSnapshot documentSnapshot = await counterRef.doc('count').get();

    studentsRef.add(data);
  }

  Stream<QuerySnapshot<Object?>> selectRecord() {
    connectWithStudentsCollection();

    return studentsRef.snapshots();
  }

  Future<void> updateRecord(
      {required String id, required Map<String, dynamic> updateData}) async {
    connectWithStudentsCollection();

    await studentsRef.doc(id).update(updateData);
  }

  deleteRecord({required String id}) async {
    connectWithStudentsCollection();

    await studentsRef.doc(id).delete();
  }
}
