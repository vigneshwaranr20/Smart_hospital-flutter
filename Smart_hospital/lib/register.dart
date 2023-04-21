import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_hospital/login.dart';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController RegController = TextEditingController();
  TextEditingController RegController1 = TextEditingController();
  TextEditingController RegController2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 70),
          width: 180,
          height: 50,
          child: Image.asset('images/Group 27.jpg'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 60, 0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFF1580EB),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Color(0xFF1580EB),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Register()),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 200, 0),
            child: ButtonBar(
              children: [
                ElevatedButton(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Color(0xFF1580EB),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 150),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 450, top: 100),
                  width: 557,
                  height: 371,
                  child: Image.network(
                      'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-craig-adderley-1563356.jpg&fm=jpg'),
                ),
                Container(
                  color: Colors.blue,
                  width: 520,
                  height: 300,
                  margin: EdgeInsets.only(
                    left: 0,
                    top: 135,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 415,
                          child: TextField(
                            controller: RegController,
                            decoration: InputDecoration(
                              hintText: "Mobile Number",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 415,
                          child: TextField(
                            controller: RegController1,
                            decoration: InputDecoration(
                              hintText: "Create Password",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: 415,
                          child: TextField(
                            controller: RegController2,
                            decoration: InputDecoration(
                              hintText: "Confirm Password",
                              hintStyle: TextStyle(color: Colors.white),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 1.0, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 50),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(198, 51),
                                    side: const BorderSide(
                                        width: 1.0, color: Colors.white70),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 20.0),
                                child: ElevatedButton(
                                  onPressed: () async {
                                    String mobileNumber = RegController.text;
                                    String createPassword = RegController1.text;
                                    String confirmpassword =
                                        RegController2.text;
                                    Map<String, dynamic> requestBody = {
                                      'mobile_number': mobileNumber,
                                      'create_password': createPassword,
                                      'confirm_password': confirmpassword,
                                    };
                                    String requestBodyJson =
                                        json.encode(requestBody);
                                    print(requestBodyJson);

                                    final response = await http.post(
                                      Uri.parse(
                                          'http://localhost:8080/hospital/Register'),
                                      headers: {
                                        'Content-Type': 'application/json',
                                      },
                                      body: requestBodyJson,
                                    );
                                    Map<String, dynamic> responseBody =
                                        json.decode(response.body);
                                    var status = responseBody['status'];
                                    print('Status: $status');

                                    if (status == '201') {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content: Text(
                                            'Already Register User Please Login',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Login()),
                                                );
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) =>
                                            AlertDialog(
                                          content: Text(
                                            'Your Successfully Registered Please Login',
                                            style: TextStyle(
                                                color: Colors.blue,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Register()),
                                                );
                                              },
                                              child: Text('OK'),
                                            ),
                                          ],
                                        ),
                                      );
                                    }
                                  },
                                  child: Text(
                                    'Save',
                                    style: TextStyle(color: Color(0xff174FAC)),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Color(0xffFFFFFF),
                                      side: const BorderSide(
                                        width: 1.0,
                                        color: Colors.white70,
                                      ),
                                      fixedSize: Size(198, 51)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
