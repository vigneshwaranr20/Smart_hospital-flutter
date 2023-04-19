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
    );
  }
}
