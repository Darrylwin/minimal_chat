import 'package:cloud_firestore/cloud_firestore.dart';
class ChatsService {
  // get instance of firestore
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

// get user stream
  Stream<List<Map<String, dynamic>>> getUsersStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        // go through each individual user
        final user = doc.data();

        //return user
        return user;
      }).toList();
    });
  }

// send messages

// get messages
}
