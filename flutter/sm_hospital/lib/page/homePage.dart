import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:sm_hospital/page/update.dart';
import 'package:sm_hospital/page/ipmodel.dart';

class MyDataTable extends StatefulWidget {
  @override
  _MyDataTableState createState() => _MyDataTableState();
}

class _MyDataTableState extends State<MyDataTable> {
  List<Map<String, dynamic>> _data = [];


  Future<List<dynamic>> fetchData() async {
     String baseUrl = "http://127.0.0.1:8000/ip/";

     var response = await http.get(Uri.parse(baseUrl),  headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        );
    final data = jsonDecode(response.body);
    return data;
  }


  @override
  void initState() {
    super.initState();
    fetchData();
  }



   Future<void> deleteRow(int index) async {

      if (index < 0 || index >= _data.length) {
    return;
  }

    final id = _data[index]['id'];
    final response = await http.delete(Uri.parse('http://127.0.0.1:8000/ip/$id'));
    if (response.statusCode == 204) {
      setState(() {
        _data.removeAt(index);
      });
    } else {

    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 48, 22, 97),
        title: Center(child: Text( 'Today IP',style: GoogleFonts.crimsonText(),)),
      ),
      body: DataTable(
        columns: [
         DataColumn(
                   label: Expanded(
                   child: Text(
                        'Update',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
                      DataColumn(
                   label: Expanded(
                   child: Text(
                        'delete',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
              DataColumn(
                   label: Expanded(
                   child: Text(
                        'IpNo',
                     style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
                   ),
                      ),
                    ),
              DataColumn(
               label: Expanded(
                   child: Text(
                      'PerID',
                    style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
              ),
              ),
             ),

     DataColumn(
     label: Expanded(
     child: Text(
     'AdmitDate',
      style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'DischargeDate',
      style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'DoctorName',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)

     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Name',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
                                           DataColumn(
     label: Expanded(
     child: Text(
     'Age',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Gender',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Address',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
     DataColumn(
     label: Expanded(
     child: Text(
     'Mobile',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
      DataColumn(
     label: Expanded(
     child: Text(
     'Advance',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
      DataColumn(
     label: Expanded(
     child: Text(
     'RoomType',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
       DataColumn(
     label: Expanded(
     child: Text(
     'RoomNo',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),

      DataColumn(
     label: Expanded(
     child: Text(
     'Status',
       style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)
     ),
     ),
     ),
        ],
        rows: List<DataRow>.generate(
          _data.length,
          (index) => DataRow(
            cells: [
              DataCell(Text(_data[index]['id'].toString())),
                       DataCell(IconButton(
                  icon: new Icon(Icons.edit,color: Color.fromARGB(255, 25, 146, 29),),
                  onPressed: () {

              //    Navigator.push(context, MaterialPageRoute( builder: (context) => UpdatePage(),  ));

                     },
    )),
                  DataCell(IconButton(
                  icon: new Icon(Icons.delete,color: Colors.red,),
                  onPressed: (){
                  deleteRow(index);
                  },
    )),
                      DataCell(Text(_data[index]['ipno'].toString())),
                      DataCell(Text(_data[index]['perid'])),
                      DataCell(Text(_data[index]['admitdate'])),
                      DataCell(Text(_data[index]['dischargedate'])),
                      DataCell(Text(_data[index]['doctorname'])),
                      DataCell(Text(_data[index]['name'])),
                      DataCell(Text(_data[index]['age'])),
                      DataCell(Text(_data[index]['gender'])),
                      DataCell(Text(_data[index]['adres'])),
                      DataCell(Text(_data[index]['mobile'])),
                      DataCell(Text(_data[index]['advance'])),
                      DataCell(Text(_data[index]['roomtype'])),
                      DataCell(Text(_data[index]['roomno'])),
                      DataCell(Text(_data[index]['status'])),
            ],
          ),
        ),
      ),
    );
  }
}