import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_chat/models/message.dart';

class ChatsService {
  // get instance of firestore and auth
  final FirebaseAuth _auth = FirebaseAuth.instance;
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
  Future<void> sendMessage(String receiveID, message) async {
    // get current user

    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    // create message
    Message newMessage = Message(
        senderID: currentUserID,
        senderEmail: currentUserEmail,
        receiveID: receiveID,
        message: message,
        timestamp: timestamp);

    // construct chat room ID for two user's chat
    List<String> ids = [currentUserID, receiveID];
    ids.sort(); // sort the ids (this ensure the chatRoomID is the same for any 2 users)
    String chatRoomID = ids.join('_');

    // add new message to database
    await _firestore
        .collection('chat_rooms')
        .doc(chatRoomID)
        .collection("messages")
        .add(newMessage.toMap());
  }

// get messages
}
