import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_app/helper/config.dart';

class UserDetails extends StatefulWidget {
  static String routeName = "/user_details";
  const UserDetails({
    super.key,
    required this.id,
    required this.name,
    required this.number,
    required this.email,
    required this.course,
    required this.city,
    required this.status,
  });
  final String id, name, number, email, course, city, status;

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  String deleteUrl = baseUrl + "itcenter/deleteUser.php";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: ListView(children: [
        ListTile(
          title: const Text(
            'Name',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Number',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.number,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Email',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.email,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Course',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.course,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'City',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.city,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        ListTile(
          title: const Text(
            'Status',
            style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            widget.status,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        const Divider(),
        //TODO:1: Create a delete button
      ]),
    );
  }

  //TODO:2 Create a delete function

}
