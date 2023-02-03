import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';
import 'package:student_app/helper/config.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'package:student_app/screens/add_user/add_user.dart';
import 'package:student_app/screens/user_details/user_details.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String getUrl = "${baseUrl}itcenter/getUsers.php";

  var data = [];

  Future<void> getALlUsers() async {
    var respose = await http.get(Uri.parse(getUrl));
    setState(() {
      var convertDatatoJson = json.decode(respose.body)['result'];
      data = convertDatatoJson;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getALlUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text(
          'Student App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      //BOdy ma listview.builder

      body: ListView.builder(
        itemCount: data.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetails(
                      id: data[index]['id'],
                      name: data[index]['name'],
                      number: data[index]['number'],
                      email: data[index]['email'],
                      course: data[index]['course'],
                      city: data[index]['city'],
                      status: data[index]['status'],
                    ),
                  ));
            },
            child: Card(
              elevation: 8,
              margin: const EdgeInsets.all(8),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                title: Text(
                  data[index]['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                subtitle: Text(
                  data[index]['email'],
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddUser(),
          ));
        },
        child: const Icon(Icons.add),
        backgroundColor: kPrimaryColor,
      ),
    );
  }
}
