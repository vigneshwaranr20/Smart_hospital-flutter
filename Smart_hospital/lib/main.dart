import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smart_hospital/appointment.dart';
import 'package:smart_hospital/register.dart';
import 'package:smart_hospital/login.dart';
import 'package:http/http.dart' as http;

import 'Model/DoctorImagesmodel.dart';
import 'api/DoctorimageApi.dart';
import 'dropdown.dart';
import 'package:smart_hospital/history.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final doctorDetail = doctorDetails();
  List<Doctor> doctorList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Welcome empty = await doctorDetail.getImages();

    setState(() {
      doctorList = empty.doctors;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 100),
          width: 180,
          height: 50,
          child: Image.asset('images/Group 27.jpg'),
        ),
        actions: <Widget>[
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
                ),
              ],
            ),
          ),
          Container(
            // Use EdgeInsets.symmetric to set equal margin values for left and right
            margin: EdgeInsets.fromLTRB(10, 0, 100, 0),
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
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          20, 0, 0, 0), // Adjusted margin values
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'we care about you',
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 20),
                          Container(
                            width: 500,
                            height: 180,
                            child: Text(
                              'We at Smart Hospital on the East Coast Road Puducherry are committed to creating a healthier society. Towards this end, we provide one of the best tertiary care services in the state. Our holistic approach to healthcare begins with primary care and extends to specialized treatments. We ensure multi disciplinary approach and patient centric care, which are essential for compassionate care. At Smart Hospital every patient is guaranteed the best medical, diagnostic and surgical services. Our services reach over 5,00,000 outpatients and 40,000 inpatients a year.',
                              style: TextStyle(),
                            ),
                          ),
                          ButtonBar(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 0, 500, 0),
                                padding: EdgeInsets.all(0),
                                width: 200,
                                height: 30,
                                child: ElevatedButton(
                                  child: Text(
                                    'Book Appointment',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(50, 20, 0, 0),
                          child: Stack(
                            children: [
                              Container(
                                width: 450,
                                height: 300,
                                color: Colors.grey,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Image.asset(
                                  'images/hospitall.jpg',
                                  width: 450,
                                  height: 290,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                          color: Color(0xffFFEADD),
                          height: 150,
                          width: double.infinity,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(520, 15, 0, 0),
                          child: Text(
                            'Our Advantages',
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(180, 100, 0, 0),
                          child: Image.network(
                            "https://www.shutterstock.com/image-photo/patient-having-consultation-female-doctor-260nw-534962014.jpg",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        /*Container(
                          margin: EdgeInsets.fromLTRB(250, 120, 0, 0),
                          child: Text(
                            'Make An Appointment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),*/
                        Container(
                          margin: EdgeInsets.fromLTRB(460, 100, 0, 0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrksXpUHoIF3Bu08wuRViUSa5HXTmnG74ISw&usqp=CAU",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(320, 120, 0, 0),
                          child: Text(
                            'Digital X-ray onsite',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 120, 0, 0),
                          child: Text(
                            'Make An Appointment',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(770, 100, 0, 0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTOZxkdxVHqivpqbyF0clKQ4oiLEMqfNHOAwg&usqp=CAU",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(620, 120, 0, 0),
                          child: Text(
                            'Emergency Services',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(1070, 100, 0, 0),
                          child: Image.network(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSGBGaUiwWXSwdXpv60xR6c7-gRr8USMcdT_A&usqp=CAU",
                            width: 50,
                            height: 50,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(950, 120, 0, 0),
                          child: Text(
                            'Immunizations',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 30, 0, 0),
                              color: Colors.purpleAccent,
                              height: 250,
                              width: 350,
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Image.network(""),
                              width: 350,
                              height: 250,
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 10, 150, 0),
                            width: 300,
                            height: 100,
                            child: Text(
                              'Easy Same or Next day Appointment',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 25,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(60, 0, 0, 0),
                                child: Text(
                                  'Smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly 2 decades.\n With paramount focus on patient care, patient safety and \n patient satisfaction, we are committed to offer exemplary \n medical services going beyond the norm of healthcare.',
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          ButtonBar(
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(0, 10, 350, 0),
                                width: 120,
                                height: 25,
                                child: ElevatedButton(
                                  child: Text(
                                    'Book Appointment',
                                    style: TextStyle(
                                      fontSize: 10,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Register()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 130, top: 30),
                    child: Text(
                      'The Best Quality Service for Your Family',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.lightBlueAccent,
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 22, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 40, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 40, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 22, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 40, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6.0,
                          spreadRadius: 2.0,
                          offset: Offset(0.0, 0.0),
                        )
                      ],
                    ),
                    margin: EdgeInsets.only(left: 40, top: 10),
                    width: 300,
                    height: 250,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Primary Care',
                            style: TextStyle(fontSize: 20, color: Colors.blue),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 10, top: 50),
                          padding: EdgeInsets.all(1),
                          child: Text(
                            'smart Hospital is a leading, multi-speciality hospital \n offering best-in-class medical services for nearly \n 2 decades. With paramount focus on patient care',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                width: 1700,
                color: Color(0xffECF3FA),
                child: Column(
                  children: [
                    Text(
                      'Meet our Specialist',
                      style: TextStyle(color: Color(0xff174FAC), fontSize: 25),
                    ),
                    SizedBox(
                      height: 401,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            doctorList.length < 4 ? doctorList.length : 4,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 0, right: 0),
                                width: 250,
                                height: 280,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: index == 0 ? 0.0 : 0.0,
                                          top: 10),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index].doctorImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 180.0,
                                      height: 200.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0.0),
                                      child: Text(
                                        doctorList[index].doctorName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0.0),
                                      child: Text(
                                        doctorList[index].specialist,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 490,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount:
                            doctorList.length >= 4 ? doctorList.length - 4 : 0,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    left: 30, bottom: 220, right: 0, top: 0),
                                width: 250,
                                height: 280,
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(
                                          left: index == 0 ? 0.0 : 0.0,
                                          top: 10),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                        child: Image.network(
                                          doctorList[index + 4].doctorImage,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      width: 180.0,
                                      height: 200.0,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0.0),
                                      child: Text(
                                        doctorList[index + 4].doctorName,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blue),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 0.0),
                                      child: Text(
                                        doctorList[index + 4].specialist,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 800),
                width: double.infinity,
                height: 100,
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
