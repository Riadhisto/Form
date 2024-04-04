import 'dart:core';
import 'package:flutter/material.dart';
import 'package:form/Views/formscreen.dart';
import 'package:form/Widgets/button_decoration.dart';
import 'package:form/Widgets/text_decoration.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final formstate = GlobalKey<FormState>();
  final TextEditingController _controllerFamily = TextEditingController();
  final TextEditingController _controllerFirst = TextEditingController();
  String _gender = 'Male';
  final TextEditingController _controllerAge = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPhone = TextEditingController();
  final TextEditingController _controllerAddress = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 167, 211, 248),
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: const Center(
            child: Text(
              'Enter your informations       ',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formstate,
            autovalidateMode: AutovalidateMode.disabled,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your family name';
                      }
                      return null;
                    },
                    controller: _controllerFamily,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.blueAccent,
                    textCapitalization: TextCapitalization.characters,
                    decoration:
                        textInputDecoration.copyWith(labelText: 'Family name'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    controller: _controllerFirst,
                    keyboardType: TextInputType.name,
                    cursorColor: Colors.blueAccent,
                    textCapitalization: TextCapitalization.words,
                    decoration:
                        textInputDecoration.copyWith(labelText: 'First name'),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 16),
                          padding: const EdgeInsets.fromLTRB(10, 8, 0, 8),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            border:
                                Border.all(color: Colors.blueAccent, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: const Text(
                            'Gender :',
                            style: TextStyle(color: Colors.white, fontSize: 22),
                          ),
                        ),
                      ),
                      const Expanded(
                          flex: 1,
                          child: SizedBox(
                            width: 10,
                          )),
                      Expanded(
                        flex: 7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RadioListTile(
                              dense: true,
                              title: const Text(
                                'Male',
                                style: TextStyle(color: Colors.blue),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              activeColor: Colors.blueAccent,
                              value: 'Male',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                            RadioListTile(
                              dense: true,
                              title: const Text(
                                'Female',
                                style: TextStyle(color: Colors.pink),
                              ),
                              contentPadding: const EdgeInsets.all(0),
                              activeColor: Colors.blueAccent,
                              value: 'Female',
                              groupValue: _gender,
                              onChanged: (value) {
                                setState(() {
                                  _gender = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your age';
                      }
                      return null;
                    },
                    controller: _controllerAge,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    cursorColor: Colors.blueAccent,
                    decoration: textInputDecoration.copyWith(labelText: 'Age'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    controller: _controllerEmail,
                    keyboardType: TextInputType.emailAddress,
                    textCapitalization: TextCapitalization.sentences,
                    cursorColor: Colors.blueAccent,
                    decoration:
                        textInputDecoration.copyWith(labelText: 'Email'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    controller: _controllerPhone,
                    keyboardType: TextInputType.phone,
                    cursorColor: Colors.blueAccent,
                    decoration:
                        textInputDecoration.copyWith(labelText: 'Phone number'),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                    controller: _controllerAddress,
                    keyboardType: TextInputType.streetAddress,
                    textCapitalization: TextCapitalization.words,
                    cursorColor: Colors.blueAccent,
                    decoration:
                        textInputDecoration.copyWith(labelText: 'Address'),
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 280,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formstate.currentState!.validate()) {
                          formstate.currentState!.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => FormScreen(
                                      family: _controllerFamily.text.trim(),
                                      first: _controllerFirst.text.trim(),
                                      gender: _gender,
                                      age: _controllerAge.text.trim(),
                                      email: _controllerEmail.text.trim(),
                                      phone: _controllerPhone.text.trim(),
                                      address: _controllerAddress.text.trim(),
                                    )),
                          );
                        }
                      },
                      style: buttonInputDecoration,
                      child: const Text(
                        'Submit',
                        style: TextStyle(fontSize: 26),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
