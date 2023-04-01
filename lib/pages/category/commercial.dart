import 'package:flutter/material.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dimand/pages/category/comm/industrial.dart';
import 'package:dimand/pages/category/comm/safety.dart';

class Commercial extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => new Scaffold(
    resizeToAvoidBottomPadding: false,
    appBar: AppBar(
      leading: IconButton(icon: Icon(Icons.arrow_back_ios), onPressed: (){Navigator.pop(context);}),
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      title: Text('Commercial Equipment'),
    ),
    body: new ListPage(),
  );
}

class ListPage extends StatefulWidget {
  ListPage({Key key,}) : super(key: key);

  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {

 football() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Indus()),
    );

  }
 rugby() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Manufacturing Equipments');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();
 }

  Future<void> picked() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => new Safety()),
    );

  }

 volleyball() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Manufacturing Materials & Tools');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();


 }

 handball() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Medical Equipment');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();

 }
 woodball() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Printing Equipment');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();

 }
 iceball() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Restaurant & Catering Equipment');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();

 }
 dogeball() async {
   final SharedPreferences prefs = await SharedPreferences.getInstance();
   await prefs.setString('dora', 'Safety Equipment');
   await prefs.setString('pin', 'Commercial Equipment & Tools');
   await picked();

 }

  drawball() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Salon Equipment');
    await prefs.setString('pin', 'Commercial Equipment & Tools');
    await picked();

  }

  blackball() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Stage Lighting & Effects');
    await prefs.setString('pin', 'Commercial Equipment & Tools');
    await picked();

  }

  eightball() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Stationery');
    await prefs.setString('pin', 'Commercial Equipment & Tools');
    await picked();

  }
  nineball() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('dora', 'Store Equipment');
    await prefs.setString('pin', 'Commercial Equipment & Tools');
    await picked();

  }

  @override
  Widget build(BuildContext context) {

    final makeBody = ListView(
      children: <Widget>[
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: football,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Industrial Ovens",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: rugby,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Manufacturing Equipments",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: volleyball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Manufacturing Materials & Tools",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: handball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Medical Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: woodball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Printing Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: iceball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Restaurant & Catering Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: dogeball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Safety Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: drawball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Salon Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: blackball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Stage Lighting & Effects",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: eightball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Stationery",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        Container(
          margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
          color: Color.fromRGBO(64, 75, 96, .9),
          child: ListTile(
            onTap: nineball,
            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            leading: Container(
              padding: EdgeInsets.only(right: 12.0),
              decoration: new BoxDecoration(
                  border: new Border(
                      right: new BorderSide(width: 1.0, color: Colors.white24))),
              child: Icon(Icons.autorenew, color: Colors.pink),
            ),
            title: Text(
              "Store Equipment",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
            // subtitle: Text("Intermediate", style: TextStyle(color: Colors.white)),
            trailing:
            Icon(Icons.keyboard_arrow_right, color: Colors.white, size: 30.0),
          ),
        ),
        ],
    );


    return makeBody;
  }
}