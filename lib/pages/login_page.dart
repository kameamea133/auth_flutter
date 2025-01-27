import 'package:auth_flutter/components/my_button.dart';
import 'package:auth_flutter/components/my_textfield.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({super.key});

  void login() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          // logo
          Icon(
            Icons.person,
            size: 80,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

            const SizedBox(height: 25),

          // app name
          Text(
            "M I N I M A L",
            style: TextStyle(fontSize: 20),
          ),

            const SizedBox(height: 50),
          // email textfield
            MyTextField(
              hintText: "email",
              obscureText: false,
              controller: emailController,
            ),


            const SizedBox(height: 10),
            // password textfield
            MyTextField(
              hintText: "password",
              obscureText: true,
              controller: passwordController,
            ),

          // forget password
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Forgot Password?",
                style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
              ],
            ),


            const SizedBox(height: 25),
          // sign in button
                MyButton(
                  text: "Login",
                  onTap: login,
                ),


            const SizedBox(height: 25),
                // don't have an account? register here.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    Text(
                        " Register Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ],
                )

          ],
        ),
      ),
      )
    );
  }
}

