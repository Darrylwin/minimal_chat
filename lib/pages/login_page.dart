import 'package:flutter/material.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // login method
  login() {}

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(Icons.message,
                size: 60, color: Theme.of(context).colorScheme.primary),

            const SizedBox(
              height: 25,
            ),

            // welcome back message

            Text(
              "Welcome back. You've been misssed",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 25,
            ),

            //email textfield
            MyTextField(
              controller: _emailController,
              hintText: "Email",
              obscureText: false,
            ),

            const SizedBox(
              height: 10,
            ),

            //password textField

            MyTextField(
              controller: _passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            const SizedBox(
              height: 25,
            ),

            //login button

            MyButton(
              text: "Login",
              onTap: login,
            ),

            //register now
          ],
        ),
      ),
    );
  }
}
