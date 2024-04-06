import 'package:flutter/material.dart';

class FormScreen extends StatelessWidget {
  final String family;
  final String first;
  final String gender;
  final String age;
  final String email;
  final String phone;
  final String address;
  const FormScreen({
    super.key,
    required this.family,
    required this.first,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 167, 211, 248),
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Center(
          child: Text(
            'Your informations       ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 8,
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.group,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Family Name',
                  style: TextStyle(
                    color: Colors.blueAccent,
                  ),
                ),
                subtitle: Text(
                  family,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.badge_rounded,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'First Name',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  first,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.cake,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Age',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  age,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.wc,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Gender',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  gender,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.mail,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Email',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  email,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.phone_android,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Phone Number',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  phone,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
            Card(
              color: Colors.white,
              margin: const EdgeInsets.all(10),
              child: ListTile(
                leading: const Icon(
                  Icons.home,
                  color: Colors.blueAccent,
                  size: 32,
                ),
                title: const Text(
                  'Address',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                subtitle: Text(
                  address,
                  style: const TextStyle(color: Colors.black87),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
