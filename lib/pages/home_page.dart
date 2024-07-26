import 'package:MinamalChatApp/components/my_drawer.dart';
import 'package:MinamalChatApp/components/user_tile.dart';
import 'package:MinamalChatApp/services/auth/auth_service.dart';
import 'package:MinamalChatApp/services/chats/chats_services.dart';
import 'package:flutter/material.dart';
// import 'package:minimal_chat/components/my_drawer.dart';
// import 'package:minimal_chat/services/auth/auth_service.dart';
// import 'package:minimal_chat/services/chats/chats_services.dart';
// import '../components/user_tile.dart';
import 'chat_page.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // chat and auth service
  final ChatsService _chatsService = ChatsService();
  final AuthService _authService = AuthService();

  void logout() {
    // get auth service
    final auth = AuthService();
    auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        title: const Text(
          "U S E R S",
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey,
        elevation: 0,
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

// construire une liste de user exepté l'utilisateur lui-même connecté
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatsService.getUsersStreamExcludingBlocked(),
      builder: (context, snapshot) {
        // message d'erreur
        if (snapshot.hasError) {
          return const Text('Error!');
        }

        //loading...
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text('Loading...');
        }

        // return Litview
        return ListView(
          children: snapshot.data!
              .map<Widget>((userData) => _buildUserListItem(userData, context))
              .toList(),
        );
      },
    );
  }

  // build individual list tile for user
  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    // affiche tous les users exepté l'utilisateur lui-même connecté
    if (userData["email"] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData["email"],
        onTap: () {
          // tapped on a user -> aller à la messagerie
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatPage(
                receiverEmail: userData["email"],
                receiverID: userData["uid"],
              ),
            ),
          );
        },
      );
    } else {
      return Container();
    }
  }
}
