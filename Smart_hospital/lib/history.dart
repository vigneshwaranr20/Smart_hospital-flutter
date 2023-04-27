import 'package:flutter/material.dart';
import 'package:smart_hospital/Model/HistoryModel.dart';
import 'api/historyApi.dart';
import 'appointment.dart';
import 'login.dart';

class History extends StatefulWidget {
  final String PatientMobileNumber;

  const History({
    required this.PatientMobileNumber,
    Key? key,
  }) : super(key: key);
  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  HistoryDataApi historyDataApi = new HistoryDataApi();

  List<Check> historyDataList = [];
  String mobileNumber = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    Historydata empty =
        await historyDataApi.mobileNum(widget.PatientMobileNumber);
    setState(() {
      historyDataList = empty.check;
    });
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
                    color: Colors.black),
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
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.underline),
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
        margin: EdgeInsets.only(left: 200),
        width: 850,
        child: DataTable(
          columns: [
            DataColumn(
              label: Container(
                width: 150,
                height: 30,
                child: Text('Patient Name'),
              ),
              numeric: false,
            ),
            DataColumn(
              label: Container(
                width: 150,
                height: 30,
                child: Text('Doctor Name'),
              ),
              numeric: false,
            ),
            DataColumn(
              label:
                  Container(width: 150, height: 30, child: Text('Specialist')),
              numeric: false,
            ),
            DataColumn(
              label: Container(width: 150, height: 30, child: Text('Date')),
              numeric: false,
            ),
          ],
          rows: historyDataList
              .map(
                (historyData) => DataRow(
                  cells: [
                    DataCell(Text('${historyData.name}')),
                    DataCell(Text('${historyData.doctorName}')),
                    DataCell(Text('${historyData.specialist}')),
                    DataCell(Text('${historyData.date}')),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );

    /*child: Table(
          border: TableBorder.all(),
          children: [
            TableRow(
              children: [
                TableCell(
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Doctor Name',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Specialist',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    width: 150,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border(
                        right: BorderSide.none,
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),*/
  }
}
