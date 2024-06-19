import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List>getFutneet() async {
  List futneet = [];
  QuerySnapshot querySnapshot = await db. collection('futneet').get();
  for(var doc in querySnapshot.docs) {
    final Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    final person = {
      "title" : data['title'],
      "uid" : doc.id,
    };
    futneet.add(person);
  }
  return futneet;
}
Future<void> addFutneet(String title) async {
  await db.collection("futneet").add({"title": title});
 
}

Future<void> updateFutneet(String uid, String newTitle) async {
  await db.collection("futneet").doc(uid).set({"title": newTitle});
}

Future<void> deleteFutneet(String uid) async {
  await db.collection("futneet").doc(uid).delete();
}