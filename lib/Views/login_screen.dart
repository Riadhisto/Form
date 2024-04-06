import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form/Views/auth_screen.dart';
import 'package:form/Views/form_screen.dart';
import 'package:form/Views/home_screen.dart';
import 'package:form/Views/signup_screen.dart';
import 'package:form/Widgets/button_decoration.dart';
import 'package:form/Widgets/text_decoration.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formstate = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 167, 211, 248),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Center(
            child: Text(
              'Enter your login credentials',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formstate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 160, 20, 0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: _controllerEmail,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.blueAccent,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Email',
                      hintText: 'Enter your email',
                      prefixIcon: const Icon(Icons.account_circle),
                      prefixIconColor: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    controller: _controllerPassword,
                    cursorColor: Colors.blueAccent,
                    textCapitalization: TextCapitalization.none,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: textInputDecoration.copyWith(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      prefixIcon: const Icon(Icons.password),
                      prefixIconColor: Colors.blueAccent,
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  SizedBox(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (formstate.currentState!.validate()) {
                          final message = await AuthScreen().login(
                            email: _controllerEmail.text.trim().toLowerCase(),
                            password: _controllerPassword.text.trim(),
                          );
                          if (message!.contains('Logged in successfully')) {
                            if (context.mounted) {
                              final docRef = FirebaseFirestore.instance
                                  .collection('Users')
                                  .doc(FirebaseAuth.instance.currentUser!.uid);
                              docRef.get().then(
                                (DocumentSnapshot doc) {
                                  final data =
                                      doc.data() as Map<String, dynamic>;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => FormScreen(
                                                family: data['Family name'],
                                                first: data['First name'],
                                                gender: data['Gender'],
                                                age: data['Age'],
                                                email: _controllerEmail.text
                                                    .trim()
                                                    .toLowerCase(),
                                                phone: data['Phone number'],
                                                address: data['Address'],
                                              )));
                                },
                              );
                            }
                          }
                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(message),
                              ),
                            );
                          }
                        }
                      },
                      style: buttonInputDecoration,
                      child: const Text(
                        'Login',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Not a member? ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const SignUpScreen();
                          }));
                        },
                        child: const Text(
                          'Sign up now',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Or you could ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return const HomeScreen();
                          }));
                        },
                        child: const Text(
                          'fill your informations manually',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
