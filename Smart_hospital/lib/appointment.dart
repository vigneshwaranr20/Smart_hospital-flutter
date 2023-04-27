import 'dart:convert';
import 'dart:html';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:smart_hospital/history.dart';

import 'api/dropdownApi.dart';

class Appointment extends StatefulWidget {
  @override
  State<Appointment> createState() => _AppointmentState();
}

class _AppointmentState extends State<Appointment> {
  TextEditingController schedcontroller = TextEditingController();
  TextEditingController schedcontroller1 = TextEditingController();
  TextEditingController schedcontroller2 = TextEditingController();
  TextEditingController schedcontroller3 = TextEditingController();
  TextEditingController schedcontroller4 = TextEditingController();
  TextEditingController schedcontroller5 = TextEditingController();
  TextEditingController schedcontroller6 = TextEditingController();
  TextEditingController schedcontroller7 = TextEditingController();

  String? _selectedSpecialist;
  List<String> _specialists = [];
  List<String> _doctors = [];

  @override
  void initState() {
    super.initState();
    _getSpecialists();
    schedcontroller4.text = "";
  }

  Future<void> _getSpecialists() async {
    final specialists = await Api.getSpecialists();
    setState(() {
      _specialists = specialists;
    });
  }

  Future<void> _getDoctors() async {
    if (_selectedSpecialist != null) {
      final doctors = await Api.getDoctorsBySpecialist(_selectedSpecialist!);
      setState(() {
        _doctors = doctors;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Container(
          margin: EdgeInsets.only(left: 130),
          width: 180,
          height: 50,
          child: Image.asset('images/Group 27.jpg'),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(top: 0, left: 0, right: 50),
            child: TextButton(
              child: Text(
                'Appointment',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline,
                    color: Colors.blue),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Appointment()));
              },
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 0, left: 10, right: 400),
            child: TextButton(
              child: Text(
                'Patient Details',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Appointment()));
              },
            ),
          )
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
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
                      margin: EdgeInsets.only(left: 200, top: 60),
                      width: 500,
                      height: 400,
                      child: Image.network(
                          'https://images.pexels.com/photos/1563356/pexels-photo-1563356.jpeg?cs=srgb&dl=pexels-craig-adderley-1563356.jpg&fm=jpg'),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 600),
                      color: Colors.blue,
                      width: 450,
                      height: 550,
                      child: Container(
                        margin: EdgeInsets.only(right: 10, top: 0),
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
                              height: 50,
                              child: TextField(
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(10),
                                ],
                                controller: schedcontroller,
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
                              height: 50,
                              child: TextField(
                                controller: schedcontroller1,
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
                              height: 50,
                              child: TextField(
                                controller: schedcontroller2,
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
                                    height: 50,
                                    child: TextField(
                                      controller: schedcontroller3,
                                      decoration: InputDecoration(
                                        hintText: "Patient Age",
                                        hintStyle:
                                            TextStyle(color: Colors.white),
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
                                    margin: EdgeInsets.only(left: 18, right: 0),
                                    width: 180,
                                    height: 50,
                                    child: TextField(
                                      style: TextStyle(color: Colors.white),
                                      controller:
                                          schedcontroller4, //editing controller of this TextField
                                      decoration: InputDecoration(
                                        icon: Icon(Icons.calendar_today,
                                            color: Colors.white),
                                        //icon of text field
                                        labelText: "Schedule Date",
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ),
                                        disabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.transparent),
                                        ), //label text of field
                                      ),

                                      readOnly:
                                          true, //set it true, so that user will not able to edit text
                                      onTap: () async {
                                        DateTime? pickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime.now(),
                                          lastDate: DateTime.now()
                                              .add(Duration(days: 7)),
                                        );

                                        if (pickedDate != null) {
                                          print(
                                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                                          String formattedDate =
                                              DateFormat('yyyy-MM-dd')
                                                  .format(pickedDate);
                                          print(
                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                          //you can implement different kind of Date Format here according to your requirement

                                          setState(() {
                                            schedcontroller4.text =
                                                formattedDate; //set output date to TextField value.
                                          });
                                        } else {
                                          print("Date is not selected");
                                        }
                                      },
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
                              height: 50,
                              child: TextField(
                                controller: schedcontroller5,
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
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 375,
                              height: 50,
                              child: DropdownButtonFormField<String>(
                                value: _selectedSpecialist,
                                hint: const Text(
                                  'Select a Specialist',
                                  style: TextStyle(color: Colors.black),
                                ),
                                items: _specialists
                                    .map((specialist) => DropdownMenuItem(
                                          value: specialist,
                                          child: Text(
                                            specialist,
                                            style:
                                                TextStyle(color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _selectedSpecialist = value;
                                    _doctors.clear();
                                    _getDoctors();
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                              /*SizedBox(
                                  width: 375,
                                  height: 20,
                                ),*/
                            ),
                            Container(
                              width: 375,
                              height: 50,
                              child: DropdownButtonFormField<String>(
                                value: _doctors.isEmpty ? null : _doctors[0],
                                hint: Text(
                                  'Select a Doctor',
                                  /*style: TextStyle(color: Colors.black),*/
                                ),
                                items: _doctors
                                    .toSet()
                                    .toList()
                                    .map(
                                      (doctor) => DropdownMenuItem(
                                        value: doctor,
                                        child: Text(
                                          doctor,
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    _doctors[0] = value!;
                                  });
                                },
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  disabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(children: [
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    child: Text('Cancel',
                                        style: TextStyle(color: Colors.white)),
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: Size(150, 50),
                                      side: const BorderSide(
                                          width: 1.0, color: Colors.white70),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 80),
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      String PatientMobileNumber =
                                          schedcontroller.text;
                                      String PatientName =
                                          schedcontroller1.text;
                                      String Patientdisease =
                                          schedcontroller2.text;
                                      String PatientAge = schedcontroller3.text;
                                      String Date = schedcontroller4.text;
                                      String PatientAddress =
                                          schedcontroller5.text;
                                      String Specialist = _selectedSpecialist!;
                                      String DoctorName = _doctors[0];

                                      // Create the request body
                                      Map<String, dynamic> requestBody = {
                                        "mobile_number": PatientMobileNumber,
                                        "name": PatientName,
                                        "disease": Patientdisease,
                                        "age": PatientAge,
                                        "date": Date,
                                        "address": PatientAddress,
                                        "Specialist": Specialist,
                                        "doctor_name": DoctorName
                                      };

                                      // Convert the request body to a JSON string
                                      String requestBodyJson =
                                          json.encode(requestBody);

                                      // Make the API call
                                      final response = await http.post(
                                        Uri.parse(
                                            'http://localhost:8080/hospital/submitAppointment'),
                                        headers: {
                                          'Content-Type': 'application/json'
                                        },
                                        body: requestBodyJson,
                                      );

                                      // Decode the response body
                                      Map<String, dynamic> responseBody =
                                          json.decode(response.body);

                                      // Get the status from the response body
                                      var status = responseBody['status'];

                                      // Print the status
                                      print('Status: $status');

                                      // Check if the status is '201'
                                      if (status == null) {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Text('Message'),
                                            content: Text(
                                              'Appointment scheduled successfully.',
                                              style: TextStyle(
                                                  color: Colors.blueAccent),
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  String PatientMobileNumber =
                                                      schedcontroller.text;
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => History(
                                                            PatientMobileNumber:
                                                                PatientMobileNumber)),
                                                  );
                                                },
                                                child: Text('OK'),
                                              ),
                                            ],
                                          ),
                                        );
                                        // If the status is '201', navigate to the Appointment screen
                                      } else {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              AlertDialog(
                                            title: Text('Error'),
                                            content: Text(
                                                'Failed to schedule appointment.'),
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
                                    child: Text('Schedule',
                                        style: TextStyle(color: Colors.blue)),
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: Size(150, 50),
                                        side: const BorderSide(
                                            width: 1.0, color: Colors.white70),
                                        backgroundColor: Colors.white),
                                  ),
                                ),
                              ]),
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
      ),
    );
  }
}
