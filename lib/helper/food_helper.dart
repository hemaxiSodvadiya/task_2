import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirebaseHelper1 {
  CloudFirebaseHelper1._();
  static final CloudFirebaseHelper1 cloudFirebaseHelper1 =
      CloudFirebaseHelper1._();

  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  late CollectionReference usersRef;
  late CollectionReference counterRef;

  void connectWithStudentsCollection() {
    usersRef = firebaseFirestore.collection("food");
  }

  void connectionWithCounterCollection() {
    counterRef = firebaseFirestore.collection("counters");
  }

  Future<void> insertRecord({required Map<String, dynamic> data}) async {
    connectWithStudentsCollection();
    connectionWithCounterCollection();

    DocumentSnapshot documentSnapshot = await counterRef.doc('count').get();

    usersRef.add(data);
  }

  Stream<QuerySnapshot<Object?>> selectRecord() {
    connectWithStudentsCollection();

    return usersRef.snapshots();
  }

  Future<void> updateRecord(
      {required String id, required Map<String, dynamic> updateData}) async {
    connectWithStudentsCollection();

    await usersRef.doc(id).update(updateData);
  }

  deleteRecord({required String id}) async {
    connectWithStudentsCollection();

    await usersRef.doc(id).delete();
  }

  addRecord({required Map<String, dynamic> data}) async {
    connectWithStudentsCollection();
    connectionWithCounterCollection();

    DocumentSnapshot documentSnapshot = await counterRef.doc('count').get();

    // Map<String, dynamic> counterData =
    //     documentSnapshot.data() as Map<String, dynamic>;
    //
    // int counter = counterData['count'];
    //
    // await usersRef.doc('${++counter}').set(data);
    //
    // await counterRef.doc('count').update({'count': counter});
    usersRef.add(data);
  }
}
