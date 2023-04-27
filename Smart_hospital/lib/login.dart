import 'dart:convert';
import 'package:flutter/services.dart';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:smart_hospital/appointment.dart';
import 'package:smart_hospital/register.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController _controller = TextEditingController();
  TextEditingController _controller1 = TextEditingController();

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
        margin: EdgeInsets.only(),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 80, left: 150),
                  width: 500,
                  height: 400,
                  child: Image.network(
                      'https://wallpaperaccess.com/full/1940042.jpg'),
                ),
                Container(
                  width: 570,
                  height: 350,
                  color: Colors.blue,
                  margin: EdgeInsets.only(top: 100, left: 600),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 515,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: _controller,
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
                        SizedBox(height: 40),
                        Container(
                          width: 515,
                          child: TextField(
                            controller: _controller1,
                            decoration: InputDecoration(
                              hintText: "Password",
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
                        SizedBox(height: 40),
                        Container(
                          margin: EdgeInsets.only(left: 0.0),
                          width: 515,
                          child: ElevatedButton(
                            onPressed: () async {
                              String mobileNumber = _controller.text;
                              String password = _controller1.text;
                              Map<String, dynamic> requestBody = {
                                'mobile_number': mobileNumber,
                                'create_password': password,
                              };
                              String requestBodyJson = json.encode(requestBody);
                              print(requestBodyJson);

                              final response = await http.post(
                                Uri.parse(
                                    'http://localhost:8080/hospital/Login'),
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Appointment()),
                                );
                              } else {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: Text('Error'),
                                    content: Text(
                                        'Check Mobile Number and Password.'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(color: Color(0xff174FAC)),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xffFFFFFF),
                                side: const BorderSide(
                                  width: 1.0,
                                  color: Colors.white70,
                                ),
                                fixedSize: Size(208, 61)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
