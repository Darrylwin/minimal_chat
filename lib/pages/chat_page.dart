import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:minimal_chat/components/my_textfield.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/services/chats/chats_services.dart';

class ChatPage extends StatelessWidget {
  final String receiverEmail;
  final String receiverID;

  ChatPage({
    super.key,
    required this.receiverEmail,
    required this.receiverID,
  });

  // text controller
  final TextEditingController _messageController = TextEditingController();

// chat and auth services
  final ChatsService _chatsService = ChatsService();
  final AuthService _authService = AuthService();

  // send messages
  void sendMessage() async {
    // if there is something inside the textfield
    if (_messageController.text.isNotEmpty) {
      // send message
      await _chatsService.sendMessage(receiverID, _messageController.text);

      // clear text controller
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(receiverEmail),
      ),
      body: Column(
        children: [
          // display all messages
          Expanded(
            child: _buildMessageList(),
          ),

          // user input
          _buildUserInput(),
        ],
      ),
    );
  }

  // build message List
  Widget _buildMessageList() {
    String senderID = _authService.getCurrentUser()!.uid;
    return StreamBuilder(
      stream: _chatsService.getMessages(receiverID, senderID),
      builder: (context, snapshot) {
        // errors
        if (snapshot.hasError) {
          return const Text("Error!");
        }

        // loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Loading...");
        }

        // return ListView
        return ListView(
          children:
              snapshot.data!.docs.map((doc) => _buildMessageItem(doc)).toList(),
        );
      },
    );
  }

  // buil MessageItem
  Widget _buildMessageItem(DocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

    return Text(
      data["message"],
    );
  }

  // build message input
  Widget _buildUserInput() {
    return Row(
      children: [
        // textfield should take up most of the space
        Expanded(
          child: MyTextField(
            controller: _messageController,
            hintText: 'Type a message',
            obscureText: false,
          ),
        ),

        // send button
        IconButton(
            onPressed: sendMessage,
            icon: const Icon(Icons.subdirectory_arrow_right_sharp))
      ],
    );
  }
}
