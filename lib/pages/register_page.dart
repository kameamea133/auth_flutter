import 'package:auth_flutter/components/my_button.dart';
import 'package:auth_flutter/components/my_textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../helper/helper_functions.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;


  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController usernameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPwController = TextEditingController();

  void register() async {
    showDialog(
      context: context,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    if (passwordController.text != confirmPwController.text) {
      Navigator.pop(context);

      displayMessageToUser("Password don't match!", context);
    } else {
      try {
        Navigator.pop(context);
        displayMessageToUser("Account created successfully!", context);

      } on FirebaseAuthException catch (e) {
        Navigator.pop(context);
        print("Firebase Auth Error: ${e.code}");
        displayMessageToUser(e.code, context);
      }
      catch (e) {
        Navigator.pop(context);
        print("Unexpected Error: $e"); 
        displayMessageToUser("An error occurred!", context);
      }
    }



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                Icon(
                  Icons.person,
                  size: 80,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),

                const SizedBox(height: 25),

                // App name
                const Text(
                  "MY AUTH APP",
                  style: TextStyle(fontSize: 20),
                ),

                const SizedBox(height: 50),

                // Username textfield
                MyTextField(
                  hintText: "username",
                  obscureText: false,
                  controller: usernameController,
                ),

                const SizedBox(height: 10),

                // Email textfield
                MyTextField(
                  hintText: "email",
                  obscureText: false,
                  controller: emailController,
                ),

                const SizedBox(height: 10),

                // Password textfield
                MyTextField(
                  hintText: "password",
                  obscureText: true,
                  controller: passwordController,
                ),

                const SizedBox(height: 10),

                // Confirm password textfield
                MyTextField(
                  hintText: "confirm Password",
                  obscureText: true,
                  controller: confirmPwController,
                ),

                const SizedBox(height: 10),

                // Forgot password
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forgot Password?",
                      style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                    ),
                  ],
                ),

                const SizedBox(height: 25),

                // Register button
                MyButton(
                  text: "Register",
                  onTap: register,
                ),

                const SizedBox(height: 25),

                // Don't have an account? Login here.
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already have an account? ",
                    ),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: Text(
                        "Login Here",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

