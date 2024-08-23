import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/sgin_in.dart'; 
import 'package:tic_tac_toe/sign_up.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // Function to validate email format
  bool isEmailValid(String email) {
    // Regular expression for validating an email address
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!isEmailValid(_emailController.text)) {
                  // Show an error message if the email is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid email address.')),
                  );
                  return;
                }
                // Call sign up method here
                await signUpWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Sign Up'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (!isEmailValid(_emailController.text)) {
                  // Show an error message if the email is invalid
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Please enter a valid email address.')),
                  );
                  return;
                }
                // Call sign in method here
                await signInWithEmailAndPassword(
                  _emailController.text,
                  _passwordController.text,
                );
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
