import 'dart:nativewrappers/_internal/vm/lib/ffi_allocation_patch.dart';

import 'package:flutter/material.dart';
import 'package:minimal_chat/components/my_drawer.dart';
import 'package:minimal_chat/services/auth/auth_service.dart';
import 'package:minimal_chat/services/chats/chats_services.dart';

import '../components/user_tile.dart';
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
      appBar: AppBar(
        title: const Text("Home"),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

// construire une liste de user exepté l'utilisateur lui-même connecté
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatsService.getUsersStream(),
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
}

// build individual list tile fir user
Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
  // affiche tous les users exepté l'utilisateur lui-même connecté
  return UserTile(
    onTap: () {
      // tapped on a user -> allre à la messagerie
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatPage(
              receiverEmail: userData["email"],
            ),
          ));
    },
    text: userData['email'],
  );
}
