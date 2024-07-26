import 'package:MinamalChatApp/components/user_tile.dart';
import 'package:MinamalChatApp/services/auth/auth_service.dart';
import 'package:MinamalChatApp/services/chats/chats_services.dart';
import 'package:flutter/material.dart';
// import 'package:minimal_chat/components/user_tile.dart';
// import 'package:minimal_chat/services/auth/auth_service.dart';
// import 'package:minimal_chat/services/chats/chats_services.dart';

class BlockedUsersPage extends StatelessWidget {
  BlockedUsersPage({super.key});

  final ChatsService chatsService = ChatsService();
  final AuthService authService = AuthService();

  // show confirm unlock box
  void _showUnblockBox(BuildContext context, String userID) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('UnBlock User'),
        content: const Text("Are you sure you want to unblock this user ?"),
        actions: [
          // cancel button
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),

          // unblock user button
          TextButton(
            onPressed: () {
              chatsService.unblockUser(userID);
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("User Unblocked")));
            },
            child: const Text("Block"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // get curent users ID
    String userID = authService.getCurrentUser()!.uid;
    // UI
    return Scaffold(
      appBar: AppBar(
        title: const Text("Blocked Users"),
        actions: const [],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: chatsService.getBlockedUsersStream(userID),
        builder: (context, snapshot) {
          // errors
          if (snapshot.hasError) {
            return const Center(
              child: Text("Error Loading ..."),
            );
          }

          // loading ...
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final blockedUsers = snapshot.data ?? [];

          // no users
          if (blockedUsers.isEmpty) {
            return const Center(
              child: Text("No Blocked User"),
            );
          }

          // load completed
          return ListView.builder(
            itemCount: blockedUsers.length,
            itemBuilder: (context, index) {
              final user = blockedUsers[index];
              return UserTile(
                onTap: () => _showUnblockBox(context, user['uid']),
                text: user["email"],
              );
            },
          );
        },
      ),
    );
  }
}
