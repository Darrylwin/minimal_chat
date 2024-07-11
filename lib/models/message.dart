import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String senderID;
  final String senderEmail;
  final String receiveID;
  final String message;
  final Timestamp timestamp;

  Message({
    required this.senderID,
    required this.senderEmail,
    required this.receiveID,
    required this.message,
    required this.timestamp,
  });

// convertir en une Map
  Map<String, dynamic> toMap() {
    return {
      'senderID': senderID,
      'senderEmail': senderEmail,
      'receiveID': receiveID,
      'message': message,
      'timestamp': timestamp,
    };
  }
}
