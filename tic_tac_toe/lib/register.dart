import 'package:flutter/material.dart';
import 'package:tic_tac_toe/home_page.dart';
import 'package:tic_tac_toe/sign_up.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

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
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 300, child: Image.asset('images/sign_up.png')),
              const SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.person,
                      color: Colors.grey,
                    ),
                    hintText: '   Email Id',
                    hintStyle: const TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide:
                            const BorderSide(color: Colors.blue, width: 2.0)),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 300,
                child: TextField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                      suffixIcon: const Icon(
                        Icons.lock,
                        color: Colors.grey,
                      ),
                      hintText: '   Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 2.0)),
                    ),
                  obscureText: true,
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (!isEmailValid(_emailController.text)) {
                    // Show an error message if the email is invalid
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please enter a valid email address.')),
                    );
                    return;
                  }
                  // Call sign up method here
                  await signUpWithEmailAndPassword(
                    _emailController.text,
                    _passwordController.text,
                  );
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const HomePage()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor:Colors.blue,
                  padding:const  EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  minimumSize:const  Size(150, 50),
                ),
                child: const Text('Sign Up',style: TextStyle(fontSize: 20)),
              ),
              const SizedBox(height: 20),
              Text('Sign up with as !',style: TextStyle(color: Colors.grey[400],fontSize: 20),),
              Text('ENJOY THE GAME',style: TextStyle(color: Colors.blue[400],fontSize: 20),)
            ],
          ),
        ),
      ),
    );
  }
}