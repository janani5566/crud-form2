import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sm_hospital/widget/button_widget.dart';
import 'package:sm_hospital/widget/navigation_drawer_widget.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sm_hospital/page/ip_today.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = '';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: MainPage(),
      );
}

class MainPage extends StatefulWidget {


  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {



  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),
        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 48, 22, 97),
        ),
      body: TodayIp(),
      );
}
