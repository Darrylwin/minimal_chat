import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:minimal_chat/auth/login_or_register.dart';
import 'package:minimal_chat/pages/login_page.dart';
import 'package:minimal_chat/pages/register_page.dart';

import '../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user is logged in
          if (snapshot.hasData) {
            return const HomePage();
          }

          // uer is logged out
          else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
