import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Image.asset('images/Group 27.jpg'),
        leadingWidth: 100,
        actions: [
          Container(
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
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      color: Color(0xFF1580EB),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          Container(
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
                    backgroundColor: Colors.white,
                    side: BorderSide(color: Colors.lightBlue),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(left: 300),
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 550,
                  ),
                  width: 757,
                  height: 671,
                  child: Image.network(
                      'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-craig-adderley-1563356.jpg&fm=jpg'),
                ),
                Container(
                  color: Colors.blue,
                  width: 700,
                  height: 446,
                  margin: EdgeInsets.only(
                    left: 0,
                    top: 115,
                  ),
                  child: Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Text(
                          'Register',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: 615,
                          child: TextField(
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
                          width: 615,
                          child: TextField(
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
                        SizedBox(height: 40),
                        Container(
                          width: 615,
                          child: TextField(
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
                        SizedBox(height: 40),
                        Container(
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 38),
                                child: ElevatedButton(
                                  onPressed: () {},
                                  child: Text('Cancel'),
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: Size(208, 61),
                                    side: const BorderSide(
                                        width: 1.0, color: Colors.white70),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 199.0),
                                child: ElevatedButton(
                                  onPressed: () {},
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
                                      fixedSize: Size(208, 61)),
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
