import 'package:flutter/material.dart';
import 'package:sm_hospital/page/add_page.dart';
import 'package:sm_hospital/page/people_page.dart';
import 'package:sm_hospital/page/user_page.dart';
import 'package:sm_hospital/page/ip_today.dart';

class NavigationDrawerWidget extends StatelessWidget {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    final name = 'SM HOSPITAL';

    final urlImage =
        'https://static.vecteezy.com/system/resources/thumbnails/006/817/240/small/creative-abstract-modern-clinic-hospital-logo-design-colorful-gradient-clinic-logo-design-free-vector.jpg';

    return Drawer(
      child: Material(
        color: Color.fromRGBO(24, 37, 100, 1),
        child: ListView(
          children: <Widget>[
            buildHeader(
              urlImage: urlImage,
              name: name,
              onClicked: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => UserPage(
                  name: 'SM Hospital',
                  urlImage: urlImage,
                ),
              )),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 6),
                  buildSearchField(),
                  const SizedBox(height: 14),
                  buildMenuItem(
                    text: 'File',
                    icon: Icons.file_copy_rounded,
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'OP',
                    icon: Icons.outbond,
                    onClicked: () => selectedItem(context, 1),
                  ),
                   const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Report',
                    icon: Icons.file_open,
                    onClicked: () => selectedItem(context, 4),
                  ),
                   const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Setting',
                    icon: Icons.settings_applications,
                    onClicked: () => selectedItem(context, 4),
                  ),
                const SizedBox(height: 10),
                  ExpansionTile(
                title: Text("IP", style: TextStyle(color: Colors.white),),
                leading: Icon(Icons.person,color: Colors.white,), //add icon
                childrenPadding: EdgeInsets.only(left:60), //children padding
                 children: [
                  ListTile(
                    iconColor: Colors.white,
                      title: Text("New IP", style: TextStyle(color: Colors.white),),
                      onTap: (){
             Navigator.of(context).push(MaterialPageRoute(
           builder: (context) => FavouritesPage(),
        ));
                      },
                  ),
                       ListTile(
                    iconColor: Colors.white,
                      title: Text("Today IP", style: TextStyle(color: Colors.white),),
                      onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                 builder: (context) => TodayIp(),
        ));
                      },
                  ),
                 ],
               ),

                  const SizedBox(height: 10),
                    buildMenuItem(
                    text: 'Help',
                    icon: Icons.help_center_outlined,
                    onClicked: () => selectedItem(context, 4),
                  ),
                   const SizedBox(height: 10),
                  buildMenuItem(
                    text: 'Appoinment',
                    icon: Icons.approval_outlined,
                    onClicked: () => selectedItem(context, 5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Container(
          padding: padding.add(EdgeInsets.symmetric(vertical: 40)),
          child: Row(
            children: [
              CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4)
                ],
              ),
              Spacer(),
              CircleAvatar(
                radius: 24,
                backgroundColor: Color.fromRGBO(30, 60, 168, 1),
                child: Icon(Icons.add_comment_outlined, color: Colors.white),
              )
            ],
          ),
        ),
      );

  Widget buildSearchField() {
    final color = Colors.white;

    return TextField(
      style: TextStyle(color: color),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        hintText: 'Search',
        hintStyle: TextStyle(color: color),
        prefixIcon: Icon(Icons.search, color: color),
        filled: true,
        fillColor: Colors.white12,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(color: color.withOpacity(0.7)),
        ),
      ),
    );
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final hoverColor = Colors.white70;

    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => PeoplePage(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => FavouritesPage(),
        ));
        break;
    }
  }
}
