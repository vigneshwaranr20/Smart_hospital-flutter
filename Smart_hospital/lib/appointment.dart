import 'package:flutter/material.dart';

class Appointment extends StatefulWidget {
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 125),
          width: 180,
          height: 50,
          child: Image.asset('images/Group 27.jpg'),
        ),
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
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(right: 300, top: 40),
              child: (Text(
                'Make An Appointment',
                style: TextStyle(color: Color(0xff1580EB), fontSize: 30),
              )),
            ),
            Container(
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 200, top: 40),
                    width: 500,
                    height: 400,
                    child: Image.network(
                        'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-craig-adderley-1563356.jpg&fm=jpg'),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 600),
                    color: Colors.blue,
                    width: 450,
                    height: 500,
                    child: Container(
                      margin: EdgeInsets.only(right: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            'Book Appointment',
                            style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.normal),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: 375,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Patient Mobile Number",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: 375,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Patient Name",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            width: 375,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Patient Disease",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30, right: 0),
                                  width: 180,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Patient Age",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30, right: 0),
                                  width: 180,
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: "Patient Age",
                                      hintStyle: TextStyle(color: Colors.white),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            width: 1.0, color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, right: 10, top: 10),
                            width: 375,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Patient Address",
                                hintStyle: TextStyle(color: Colors.white),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1.0, color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
