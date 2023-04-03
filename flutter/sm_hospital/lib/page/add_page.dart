import 'package:flutter/material.dart';
import 'package:sm_hospital/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:sm_hospital/page/ip_today.dart';


class FavouritesPage extends StatefulWidget {

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
var name = TextEditingController();

var age = TextEditingController();

var gender = TextEditingController();

var adres = TextEditingController();

var mobile = TextEditingController();

var advance = TextEditingController();

var roomtype = TextEditingController();

var roomno = TextEditingController();

var status = TextEditingController();

var admitdate = TextEditingController();

var dischargedate = TextEditingController();

var doctorname = TextEditingController();

var ipno = TextEditingController();

var perid = TextEditingController();

 String baseUrl = "http://127.0.0.1:8000/ip/";

  Future<List> InsertStudent() async {
    try {
      var response = await http.post(Uri.parse(baseUrl),  headers: {
          "Accept": "application/json",
          "Access-Control_Allow_Origin": "*"
        },
        body: {"name" : name.text, "age" : age.text,"gender" : gender.text,"adres" : adres.text,"mobile" : mobile.text,
        "advance" : advance.text, "roomtype" : roomtype.text,"roomno" : roomno.text,"status" : status.text,"admitdate" : admitdate.text,
         "dischargedate" : dischargedate.text, "doctorname" : doctorname.text,"ipno" : ipno.text,"perid" : perid.text,
        }
        );
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }

  var items = ['Female', 'Male'];
  var items1 = ['Normal', 'AC'];

  @override
  Widget build(BuildContext context) => Scaffold(
      backgroundColor: Colors.blue,

        body: Center(

          child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,bottom: 30),
              child: Column(
                children: [
                  SingleChildScrollView(
                    child: Container(
                         width: MediaQuery.of(context).size.width * 0.90,
                           height: MediaQuery.of(context).size.height * 0.90,

                           decoration: BoxDecoration(
                           color:  Colors.white,
                      border: Border.all(
                        color:  Color.fromARGB(255, 48, 22, 97),
                        width: 12,
                      )),


                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
              padding: const EdgeInsets.only(top: 18, left: 25),
                child: Container(
                             decoration: BoxDecoration(
               border: Border.all(color: Colors.black),
               ),
               width: MediaQuery.of(context).size.width * 0.30,
                height: MediaQuery.of(context).size.height * 0.10,
                child: Padding(
                padding: const EdgeInsets.only(top: 7, left: 12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 7, right: 80),
                            child: Text('IP No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                          ),
                        ],
                      ),

                      ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Padding(
                         padding:  EdgeInsets.only(top: 2, ),
                           child:  SizedBox(
                           width: MediaQuery.of(context).size.width * 0.26,
                           height: 20,
                            child: TextField(
                              controller: ipno,
                                      decoration: InputDecoration(
                                  border: OutlineInputBorder(),

                             ),
                                             ),
                            ),
                         ),
                       ],
                     ),
                      Container(
                      width: MediaQuery.of(context).size.width * 0.10,

                      )
                  ],
                ),
                ),
              ),

        ),
        if (Responsive.isDesktop(context))
        Padding(
          padding: const EdgeInsets.only(top: 18, left: 1, ),
          child: Container(
            color:  Color.fromARGB(255, 48, 22, 97),
            width: MediaQuery.of(context).size.width * 0.45,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Center(

             child: Text(
                 'New Admission', style: GoogleFonts.crimsonText(color: Colors.white, fontSize: 30 ,fontWeight:  FontWeight.w800, ),textAlign: TextAlign.center,),
                ),
          ),
        ),
    if (!Responsive.isDesktop(context))
     Padding(
          padding: const EdgeInsets.only(top: 18, left: 1, ),
          child: Container(
            color:  Color.fromARGB(255, 48, 22, 97),
            width: MediaQuery.of(context).size.width * 0.48,
            height: MediaQuery.of(context).size.height * 0.10,
            child: Center(
            child: FittedBox(
             child: Text(
                 'New Admission', style: GoogleFonts.crimsonText(color: Colors.white, fontSize: 30 ,fontWeight:  FontWeight.w800, ),textAlign: TextAlign.center,),
            ),

                ),
            ),
           ),

         ],

      ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('PerID', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),

                        ),
                        Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 26,
                            child: TextField(
                            controller: perid,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(

                             ),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            children: [
                            Text('Name', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),
                        ),
                         Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 26,
                            child: TextField(
                             controller: name,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            children: [
                            Text('Address', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),
                        ),
                        Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 55,
                            child: TextField(
                             controller: adres,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            children: [
                            Text('Advance', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),
                        ),
                           Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 26,
                            child: TextField(
                            controller: advance,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            children: [
                            Text('Room No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),
                        ),
                         Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 26,
                            child: TextField(
                              controller: roomno,
                            decoration:  InputDecoration(
                             border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.only(top: 15, left: 25),
                          child: Column(
                            children: [
                            Text('Status', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                            ],
                          ),
                        ),
                         Padding(
                         padding: const EdgeInsets.only(top: 1, left: 25),
                          child: Column(
                            children: [
                               SizedBox(
                             width: MediaQuery.of(context).size.width * 0.35,
                             height: 26,
                            child: TextField(
                            controller: status,
                            decoration: InputDecoration(
                             border: OutlineInputBorder(),

                               ),
                                               ),
                              ),
                            ],
                          ),
                        ),
                              ],
                            ),
                              Container(
                                margin: EdgeInsets.only(bottom: 30, left: 10),
                                child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                   Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                Text('Doctor Name', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),

                                                      ),
                                                      Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.35,
                                                           height: 26,
                                                          child: TextField(
                                                          controller: doctorname,
                                                          decoration: InputDecoration(
                                                           border: OutlineInputBorder(

                                                           ),

                                 ),
                                                 ),
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                      Row(
                                                        children: [
                                                        Column(
                                                          children: [
                                                       Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                          Text('Age', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.13,
                                                           height: 26,
                                                          child: TextField(
                                                          controller: age,
                                                          decoration: InputDecoration(
                                                           border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                          ],
                                                        ),
                                                        Column(
                                                          children: [
                                  Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 5),
                                                        child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                                          children: [
                                                          Text('Gender', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 5),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.21,
                                                           height: 26,
                                  child:  TextField(
                                                      controller: gender,
                                                     decoration: InputDecoration(
                                                      border: OutlineInputBorder(),
                                                    suffixIcon: PopupMenuButton<String>(
                                                    icon: const Icon(Icons.arrow_drop_down),
                                                    onSelected: (String value) {
                                                     gender.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items
                                          .map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value), value: value);
                                      }).toList();
                                    },
                                  ),
                                ),
                              )
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                          ],
                                                        )
                                                        ],
                                                      ),

                                                        Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          children: [
                                                          Text('Cell No', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.35,
                                                           height: 26,
                                                          child: TextField(
                                 controller: mobile,
                                                          decoration: InputDecoration(
                                                           border: OutlineInputBorder(),

                                 ),
                                                 ),
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          children: [
                                                          Text('Room Type', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                         Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.35,
                                                           height: 26,
                                                          child: TextField(
                                                      controller: roomtype,
                                                     decoration: InputDecoration(
                                                      border: OutlineInputBorder(),
                                                    suffixIcon: PopupMenuButton<String>(
                                                    icon: const Icon(Icons.arrow_drop_down),
                                                    onSelected: (String value) {
                                                     roomtype.text = value;
                                    },
                                    itemBuilder: (BuildContext context) {
                                      return items1
                                          .map<PopupMenuItem<String>>((String value) {
                                        return new PopupMenuItem(
                                            child: new Text(value), value: value);
                                      }).toList();
                                    },
                                  ),
                                ),
                              )
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          children: [
                                                          Text('Admit Date', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.35,
                                                           height: 26,
                                                          child: TextField(
                                                          controller: admitdate,
                                                          decoration: InputDecoration(
                                                            suffixIcon: Icon(Icons.calendar_today_rounded),

                                                           border: OutlineInputBorder(),
                                      ),
                                      onTap: () async {
                                        DateTime? pickeddate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101));

                                          if(pickeddate != null){
                                          setState(() {
                                         admitdate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                          });
                                          }
                                      },
                                     ),
                                ),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                        padding: const EdgeInsets.only(top: 15, left: 25),
                                                        child: Column(
                                                          children: [
                                                          Text('Discharge Date', style: GoogleFonts.crimsonText(color: Colors.black, fontSize: 17 ,fontWeight:  FontWeight.w800,)),
                                                          ],
                                                        ),
                                                      ),
                                                       Padding(
                                                       padding: const EdgeInsets.only(top: 1, left: 25),
                                                        child: Column(
                                                          children: [
                                 SizedBox(
                                                           width: MediaQuery.of(context).size.width * 0.35,
                                                           height: 26,
                                                          child: TextField(
                                                         controller: dischargedate,
                                                          decoration: InputDecoration(
                                                          suffixIcon: Icon(Icons.calendar_today_rounded),

                                                           border: OutlineInputBorder(),

                                 ),
                                  onTap: () async {
                                        DateTime? pickeddate = await showDatePicker(
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(2000),
                                          lastDate: DateTime(2101));

                                          if(pickeddate != null){
                                          setState(() {
                                         dischargedate.text = DateFormat('dd/MM/yyyy').format(pickeddate);
                                          });
                                          }
                                      },
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 19, left: 25),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              child: OutlinedButton(
                                    onPressed: () {
                                      InsertStudent();
                                    Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => TodayIp(),
                    )
                      );
                        },

                                               child: Text('Save',style:  GoogleFonts.crimsonText(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w800),),

                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(255, 48, 22, 97),
                                            shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),

                                          ),
                                        ),
                                         ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 19, left: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              child: OutlinedButton(
                                    onPressed: () {
                                        },
                                               child: Text('Clear',style:  GoogleFonts.crimsonText(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w800),),

                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(255, 48, 22, 97),
                                            shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),

                                          ),
                                        ),
                                         ),
                            ),
                          ),
                           Padding(
                            padding: const EdgeInsets.only(top: 19, left: 5),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.18,
                              child: OutlinedButton(
                                    onPressed: () {

                                        },

                                               child: Text('Cancel',style:  GoogleFonts.crimsonText(color: Colors.white,fontSize: 15.0,fontWeight: FontWeight.w800),),

                                            style: OutlinedButton.styleFrom(
                                              backgroundColor: Color.fromARGB(255, 48, 22, 97),
                                            shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(0),

                                          ),
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
              ],
              ),
            )
          ],
          ),
        ),
      );
}

