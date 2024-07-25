import 'package:flutter/material.dart';
import 'package:minimal_chat/services/chats/chats_services.dart';
import 'package:minimal_chat/themes/theme_provider.dart';
import 'package:provider/provider.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isCurrentUser;
  final String messageID, userID;

  const ChatBubble({
    super.key,
    required this.message,
    required this.isCurrentUser,
    required this.messageID,
    required this.userID,
  });

  // show options
  void _showOptions(
    BuildContext context,
    String messageID,
    String userID,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return SafeArea(
            child: Wrap(
              children: [
                // report message button
                ListTile(
                  leading: const Icon(Icons.flag),
                  title: const Text("Report"),
                  onTap: () {
                    Navigator.pop(context);
                    _reportMessage(context, messageID, userID);
                  },
                ),

                // block user button
                ListTile(
                  leading: const Icon(Icons.block),
                  title: const Text("Block User"),
                  onTap: () {
                    Navigator.pop(context);
                    _blockUser(context, userID);
                  },
                ),

                // cancel button
                ListTile(
                  leading: const Icon(Icons.cancel),
                  title: const Text("Cancel"),
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          );
        });
  }

  // report message
  // _reportMessage(BuildContext context, String messageID, String userID) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Report Message'),
  //       content: const Text("Are you sure you want to report this message ?"),
  //       actions: [
  //         // cancel button
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("Cancel"),
  //         ),

  //         // report button
  //         TextButton(
  //           onPressed: () {
  //             ChatsService().reportUser(messageID, userID);
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text("Message Reported"),
  //               ),
  //             );
  //           },
  //           child: const Text("Report"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // block user
  // void _blockUser(BuildContext context, String userID) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       title: const Text('Block User'),
  //       content: const Text("Are you sure you want to block this user ?"),
  //       actions: [
  //         // cancel button
  //         TextButton(
  //           onPressed: () => Navigator.pop(context),
  //           child: const Text("Cancel"),
  //         ),

  //         // block button
  //         TextButton(
  //           onPressed: () {
  //             ChatsService().blockUser(userID);
  //             Navigator.pop(context);
  //             ScaffoldMessenger.of(context).showSnackBar(
  //               const SnackBar(
  //                 content: Text("User Blocked"),
  //               ),
  //             );
  //           },
  //           child: const Text("Block"),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    // correct colors for light vs dark mode
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;

    return GestureDetector(
      onLongPress: () {
        if (!isCurrentUser) {
          // show options
          _showOptions(context, messageID, userID);
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: isCurrentUser
              ? (isDarkMode ? Colors.green.shade900 : Colors.green)
              : (isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200),
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 25.0),
        child: Text(
          message,
          style: TextStyle(
            color: isCurrentUser
                ? Colors.white
                : (isDarkMode ? Colors.white : Colors.black),
          ),
        ),
      ),
    );
  }
}
