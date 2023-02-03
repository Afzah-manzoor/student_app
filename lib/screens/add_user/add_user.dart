import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:student_app/constants.dart';
import 'package:http/http.dart' as http;
import '../../helper/config.dart';

class AddUser extends StatefulWidget {
  static String routeName = "/add_user";
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController numberCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController courseCtrl = TextEditingController();
  TextEditingController cityCtrl = TextEditingController();
  TextEditingController statusCtrl = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String addUrl = baseUrl + "itcenter/addUsers.php";
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
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text('Add student data'),
                Spacer(),
                buildFormField('Name', nameCtrl),
                Spacer(),
                buildFormField('Number', numberCtrl),
                Spacer(),
                buildFormField('Email', emailCtrl),
                Spacer(),
                buildFormField('Course', courseCtrl),
                Spacer(),
                buildFormField('City', cityCtrl),
                Spacer(),
                buildFormField('Status', statusCtrl),
                Spacer(flex: 3),
                FloatingActionButton(
                  onPressed: () {
                    sendData();
                  },
                  child: Icon(Icons.add),
                ),
              ]),
        ),
      ),
    );
  }

//Send data to Database
  Future<void> sendData() async {
    var response = await http.post(
      Uri.parse(addUrl),
      body: {
        'name': nameCtrl.text,
        'number': numberCtrl.text,
        'email': emailCtrl.text,
        'course': courseCtrl.text,
        'city': cityCtrl.text,
        'status': statusCtrl.text,
      },
    );

    if (response.statusCode == 200) {
      print('=====responde body====');

      var decodedData = jsonDecode(response.body);
      print(decodedData['success']);
      if (decodedData['success'] == 1) {
        //Refresh ui
      }
    } else {
      print('ERROR. TRY AGAIN');
    }
  }

  TextFormField buildFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.next,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter here';
        }
        return null;
      },
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
          borderSide: const BorderSide(color: kPrimaryColor),
        ),
      ),
    );
  }
}
