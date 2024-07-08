import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class RegisterPage extends StatelessWidget {
  // email and password controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  // tap to go to RegisterPage
  final void Function()? onTap;

  // register method
  register() {}

  RegisterPage({super.key,required this.onTap});

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
              "Let's create an account",
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
              height: 10,
            ),

            // confirm password textfield
            MyTextField(
              controller: _confirmPasswordController,
              hintText: "Confirm Password",
              obscureText: true,
            ),

            const SizedBox(
              height: 25,
            ),

            //register button

            MyButton(
              text: "Register",
              onTap: register,
            ),

            const SizedBox(
              height: 25,
            ),

            //register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account ?",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    "Login now",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
